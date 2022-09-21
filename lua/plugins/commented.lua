--https://github.com/winston0410/commented.nvim
-- local opts = {
	-- comment_padding = " ", -- padding between starting and ending comment symbols
	-- keybindings = {n = "<leader>c", v = "<leader>c", nl = "<leader>cc"}, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
	-- prefer_block_comment = false, -- Set it to true to automatically use block comment when multiple lines are selected
	-- set_keybindings = true, -- whether or not keybinding is set on setup
	-- ex_mode_cmd = "Comment" -- command for commenting in ex-mode, set it null to not set the command initially.
-- }
require("commented").setup({
    keybindings = {n = "<leader>cn", v = "<leader>cc", nl = "<leader>ccc"}, -- what key to toggle comment, nl is for mapping <leader>c$, just like dd for d
    prefer_block_comment = true, -- Set it to true to automatically use block comment when multiple lines are selected
    codetags_keybindings = {
        --fixme = "<leader>c",
        --fixme_line = "<leader>cc",
        todo = "<leader>td",
        --todo_line = "<leader>tt",
        --bug = "<leader>b",
        --bug_line = "<leader>bb",
        --note = "<leader>n",
        --note_line = "<leader>nn",
        --wont_fix = "<leader>w",
        --wont_fix_line = "<leader>ww",
    },
})
