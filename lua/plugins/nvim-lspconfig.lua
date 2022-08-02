-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig

local nvim_lsp = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('x', '<space>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<C-l>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<C-o>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- vim.diagnostic.config({
--     virtual_text = false,
--     signs = true,
--     float = { border = "single"},
-- })
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--[[

Language servers:

Add your language server to `servers`
-------------
use the command ":Mason" to add automaticly
--]]

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'bashls', 'efm', 'pyright', 'html', 'tsserver', 'diagnosticls', 'phpactor'}
--without tsserver
--local servers = { 'bashls', 'pyright', 'html', 'tsserver'}
--local servers = { 'bashls', 'pyright', 'clangd', 'html', 'tsserver'}

-- Set settings for language servers below
--
-- tsserver settings
local ts_settings = function(client)
  client.resolved_capabilities.document_formatting = false
  ts_settings(client)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    ts_settings = ts_settings,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

--require "lspconfig".tsserver.setup {}
--visit https://github.com/mattn/efm-langserver
nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {
                lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
                lintStdin = true,
                lintFormats = {
                    "%f:%l:%c: %m"
                },
                lintIgnoreExitCode = true,
                formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
                formatStdin = true
            },
            sh = {
                {LintCommand = "shellcheck -f gcc -x",
                 LintFormats = {
                     "%f:%l:%c: %trror: %m",
                     "%f:%l:%c: %tarning: %m",
                     "%f:%l:%c: %tote: %m"}
                 }
            },
            dockerfile = {
                {
                    LintCommand = "hadolint --no-color",
                    LintFormats = {
                        "%f:%l %m",
                    }
                }
            },
            python = {
                {
                    LintCommand = "mypy --show-column-numbers",
                    LintFormats = {
                        "%f:%l:%c: %trror: %m",
                        "%f:%l:%c: %tarning: %m",
                        "%f:%l:%c: %tote: %m"
                    }
                },
                {
                    LintCommand = "flake8 --stdin-display-name ${INPUT} -",
                    LintFormats = {
                        "%f:%l:%c: %m"
                    }
                },
                {
                    LintCommand = "pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}",
                    LintFormats = {
                        "%f:%l:%c:%t:%m"
                    }
                },
                {
                    FormatCommand = "autopep8 -"
                }
                --{
                --    FormatCommand = {"autopep8 -", FormatStdin = true}
                --}
            }
        }
    }
    --settings = {
    --    filetypes = {"python"},
    --    languages = {
    --      python = {formatCommand = "autopep8 -", formatStdin = true}
    --    }
    --}
}
nvim_lsp.phpactor.setup{}
nvim_lsp.tsserver.setup{}

-----------------------------------------------
--- Linter setup
local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  python = "flake8",
  php = {"phpcs"},
}
 
local linters = {
  eslint = {
    sourceName = "eslint",
    command = "./node_modules/.bin/eslint",
    rootPatterns = {".eslintrc.js", "package.json"},
    debouce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  },
  flake8 = {
    command = "flake8",
    sourceName = "flake8",
    args = {"--format", "%(row)d:%(col)d:%(code)s: %(text)s", "%file"},
    formatPattern = {
      "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
      {
          line = 1,
          column = 2,
          message = {"[", 3, "] ", 5},
          security = 4
      }
    },
    securities = {
      E = "error",
      W = "warning",
      F = "info",
      B = "hint",
    },
  },
  phpcs = {
    command = "/home/malisoftdev/.config/composer/vendor/bin//phpcs",
    sourceName = "phpcs",
    debounce = 300,
    rootPatterns = {"composer.lock", "vendor", ".git"},
    args = { "--standard=PSR12", "--report=emacs", "-s", "-" },
    offsetLine = 0,
    offsetColumn = 0,
    sourceName = "phpcs",
    formatLines = 1,
    formatPattern = {
      --"^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)(\\r|\\n)*$",
      "^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)$",
      {
        line = 1,
        column = 2,
        message = 4,
        security = 3
      }
    },
    securities = {
      error = "error",
      warning = "warning",
    },
    requiredFiles = {"vendor/bin/phpcs"}
  },
}
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
  },
}