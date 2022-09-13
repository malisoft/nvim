local keymap = vim.keymap.set
local saga = require 'lspsaga'
saga.init_lsp_saga({
  code_action_lightbulb = {
      enable = true,
      enable_in_insert = true,
      cache_code_action = true,
      sign = true,
      update_time = 150,
      sign_priority = 20,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  custom_kind = {
    Field = '#1A4065',
  },
  border_style = 'double',
  saga_winblend = 0,
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  --show_diagnostic_source = true,
  code_action_num_shortcut = true,
})

keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
