return {
  -- 用插件的 load()：走 catppuccin 官方配色
  { "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load()
      end } },
}
