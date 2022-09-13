
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.

--[[ require("luasnip.loaders.from_vscode").load({ include = { "python" } }) -- Load only python snippets
require("luasnip.loaders.from_vscode").load({ include = { "typescript" } }) -- Load only typescript snippets
require("luasnip.loaders.from_vscode").load({ include = { "javascript" } }) -- Load only javascript snippets
require("luasnip.loaders.from_vscode").load({ include = { "php" } }) -- Load only php snippets--]]

-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
-- a similar `package.json`)
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } }) -- Load snippets from my-snippets folder

-- You can also use lazy loading so snippets are loaded on-demand, not all at once (may interfere with lazy-loading luasnip itself).
require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

