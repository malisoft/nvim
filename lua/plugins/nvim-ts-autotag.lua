--https://github.com/windwp/nvim-ts-autotag
local filetypes = {
    'html', 'javascriptreact', 'typescriptreact', 'vue', 'tsx', 'jsx', 'rescript',
    'xml',
    'php',
    'markdown',
    'glimmer','handlebars','hbs'
}
local skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
}
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  filetypes = filetypes,
}
