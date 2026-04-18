return {
  "neovim/nvim-lspconfig",
  ---@param opts PluginLspOpts
  opts = function(_, opts)
    -- 默认关闭 inlay hints
    opts.inlay_hints.enabled = false

    -- 强制 basedpyright 和其他 LSP 报错使用英文
    -- (在 nvim 启动时注入环境变量，覆盖系统默认的中文 locale)
    vim.env.LANG = "en_US.UTF-8"
    vim.env.LC_ALL = "en_US.UTF-8"
  end,
}
