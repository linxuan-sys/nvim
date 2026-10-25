return {
  -- 用插件的 load()：走 catppuccin 官方配色，字符串 "catppuccin" 会命中 nvim 内核同名主题
  { "LazyVim/LazyVim", opts = { colorscheme = function() require("catppuccin").load() end } },
}
