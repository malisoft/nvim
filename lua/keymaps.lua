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

--allow to move in insert mode
map('i', '<C-h>', '<left>', default_opts)
map('i', '<C-j>', '<down>', default_opts)
map('i', '<C-k>', '<up>', default_opts)
map('i', '<C-l>', '<right>', default_opts)

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
map('n', '<C-g>', ':LazyGit<CR>', default_opts)       -- open/close

--nvim-fzf-lua
map('n', '<C-p>', ':FzfLua files<CR>', default_opts)       -- open/close

-- nvim-tree
map('n', '<C-n>', ':Neotree toggle<CR>', default_opts)       -- open/close
--map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file


-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "gr", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- tabby
map("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
map("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true })
map("n", "<leader>tn", ":tabn<CR>", { noremap = true })
map("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
map("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
map("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })


-- Neogen
-- to generate better annotations ->:Neogen func|class|type|...
map("n", "<leader>ng", ":lua require('neogen').generate()<CR>", { noremap = true })

-- Hop
-- allows jump in a document
map("n", "<leader>sk", ":HopWord<CR>", { noremap = true })

