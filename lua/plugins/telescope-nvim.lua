local sorters, actions, previewers =
require('telescope.sorters'), require('telescope.actions'), require('telescope.previewers')

local rip_grep_config = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
}
require('telescope').setup{
  defaults = {
    vimgrep_arguments = rip_grep_config,
    layout_strategy = 'horizontal',
    ayout_config = {
            vertical = { width = 0.95, anchor=2 }
    },
                initial_mode = 'insert',
                prompt_prefix = ' ❯',
                file_ignore_patterns = { '.git/*', 'node_modules', 'env/*' },
                color_devicons = true,
                winblend = 20,
                file_sorter = sorters.get_fzy_sorter,
                generic_sorter = sorters.get_fzy_sorter,
                file_previewer = previewers.vim_buffer_cat.new,
                grep_previewer = previewers.vim_buffer_vimgrep.new,
                qflist_previewer = previewers.vim_buffer_qflist.new,
                mappings = {
                        i = {
                                ['<C-j>'] = actions.move_selection_next,
                                ['<C-k>'] = actions.move_selection_previous,
                                ['<Esc>'] = actions.close,
                        },
                },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
     -- Fast, fast, really fast sorter
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    media_files = {
        filetypes = {"png", "jpg", "pdf", "jpeg"},
        find_cmd = "rg"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      --hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}
require("telescope").load_extension("file_browser")
--require('telescope').extensions.media_files.media_files()
require("telescope").load_extension("ui-select")
require("telescope").load_extension('fzy_native')
require('telescope').load_extension('media_files')
-- Using Lua functions
local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").commands()<cr>', opts)
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
map('n', '<leader>ff', ':Telescope file_browser<cr>', opts)
map('n', '<leader>fm', '<cmd>lua require("telescope.builtin").media_files()<cr>', opts)
--map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fgb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
map('n', '<leader>fgc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
map('n', '<leader>fgs', '<cmd>lua require("telescope.builtin").git_status()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
