local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-- clear search highlighting
map('n', '<leader>/', ':nohl<CR>', default_opts)


-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

map('n', '<C-t>', ':Term<CR>', default_opts)


--resize a panel
map('n', '<right>', ':vertical resize +5<CR>', default_opts)
map('n', '<left>', ':vertical resize -5<CR>', default_opts)
map('n', '<up>', ':resize +5<CR>', default_opts)
map('n', '<down>', ':resize -5<CR>', default_opts)

--to move the indentation of a code block with tab and shift tab
map('v', '<Tab>', '>gv', default_opts)
map('v', '<S-Tab>', '<gv', default_opts)

-- fast file saving
map('n', '<leader>w', ':w<CR>', default_opts)

-- fast neovim quit
map('n', '<leader>q', ':q<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)


--nvim-lazygit
map('n', '<leader>lg', ':LazyGit<CR>', default_opts)       -- open/close

--vim-fzf
map('n', '<C-p>', ':FZF<CR>', default_opts)       -- open/close

-- nvim-tree
map('n', '<leader>nt', ':Neotree toggle<CR>', default_opts)  -- open/close
map('n', '<leader>nr', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", default_opts)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", default_opts)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", default_opts)
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", default_opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", default_opts)
map("n", "gr", "<cmd>Trouble lsp_references<cr>", default_opts)
map("n", "gi", "<cmd>Trouble lsp_implementation<cr>", default_opts)

-- Neogen
-- to generate better annotations ->:Neogen func|class|type|...
map("n", "<leader>an", ":lua require('neogen').generate()<CR>", { noremap = true })

-- Hope
-- allows jump in a document
map("n", "<leader>jp", ":HopWord<CR>", { noremap = true })

-- Barbar
-- Move to previous/next
map('n', "<leader>j", ':bprevious<CR>', default_opts)
map('n', '<leader>k', ':bnext<CR>', default_opts)
-- Close a Buffer
map('n', '<leader>e', ':bdelete<CR>', default_opts)
-- To acept copilot suggestion
map("i", "<C-l>", "copilot#Accept('<CR>')", { expr = true })
