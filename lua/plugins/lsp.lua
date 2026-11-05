return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- 默认关闭所有LSP内嵌提示inlay hints
    opts.inlay_hints.enabled = false
    return opts
  end,
}
