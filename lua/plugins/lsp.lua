return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts PluginLspOpts
    opts = function(_, opts)
      -- 默认关闭 inlay hints
      opts.inlay_hints.enabled = false

      -- 关闭 markdown 报错：marksman 不启动
      opts.servers.marksman = { enabled = false }

      -- 强制 basedpyright 和其他 LSP 报错使用英文
      -- (在 nvim 启动时注入环境变量，覆盖系统默认的中文 locale)
      -- vim.env.LANG = "en_US.UTF-8"
      -- vim.env.LC_ALL = "en_US.UTF-8"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      -- 关闭 markdownlint 报错（空表无法覆盖，用 condition 跳过）
      linters = {
        ["markdownlint-cli2"] = {
          condition = function()
            return false
          end,
        },
      },
    },
  },
}
