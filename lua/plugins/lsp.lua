return {
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
