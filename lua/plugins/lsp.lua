return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- 默认关闭所有LSP内嵌提示inlay hints
    opts.inlay_hints.enabled = false

    -- basedpyright 用系统 /usr/bin 的版本，不让 Mason 管理
    opts.servers = opts.servers or {}
    opts.servers.basedpyright = vim.tbl_deep_extend("force", opts.servers.basedpyright or {}, {
      mason = false,
      cmd = { "/usr/bin/basedpyright-langserver", "--stdio" },
    })

    return opts
  end,
}
