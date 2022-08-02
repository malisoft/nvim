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
map('n', '<C-g>', ':LazyGit<CR>', default_opts)       -- open/close

--nvim-fzf-lua
--map('n', '<C-p>', ':FzfLua files<CR>', default_opts)       -- open/close
--vim-fzf
map('n', '<C-p>', ':FZF<CR>', default_opts)       -- open/close

-- nvim-tree
map('n', '<leader>nt', ':Neotree toggle<CR>', default_opts)       -- open/close
--map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
--map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file


-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
map("n", "gr", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- Neogen
-- to generate better annotations ->:Neogen func|class|type|...
map("n", "<leader>ng", ":lua require('neogen').generate()<CR>", { noremap = true })

-- Hope
-- allows jump in a document
map("n", "<leader>jp", ":HopWord<CR>", { noremap = true })

-- Barbar
-- Move to previous/next
map('n', "<leader>j", '<Cmd>BufferPrevious<CR>', default_opts)
map('n', '<leader>k', '<Cmd>BufferNext<CR>', default_opts)
-- Close a Buffer
map('n', '<leader>e', '<Cmd>BufferClose<CR>', default_opts)
map('n', '<leader>p', '<Cmd>BufferPin<CR>', default_opts)
-- Re-order to previous/next
map('n', '<A-j>', '<Cmd>BufferMovePrevious<CR>', default_opts)
map('n', '<A-k>', '<Cmd>BufferMoveNext<CR>', default_opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', default_opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', default_opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', default_opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', default_opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', default_opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', default_opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', default_opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', default_opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', default_opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', default_opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', default_opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', default_opts)
-- Magic buffer-picking mode
map('n', '<leader>bp', '<Cmd>BufferPick<CR>', default_opts)


--map('i', '<C-a>', 'copilot#Accept()<CR>', default_opts)

map("i", "<C-l>", "copilot#Accept('<CR>')", { expr = true })
--vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })
--imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

-- Sort automatically by...
--map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
--map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
--map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
--map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
