return {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>y",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Yazi",
    },
    {
      "<leader>Y",
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi cwd",
    },
    {
      "<C-Up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Yazi toggle",
    },
  },
  init = function()
    require("which-key").add({
      { "<leader>y", icon = { icon = "󰇥", color = "yellow" } },
      { "<leader>Y", icon = { icon = "󰇥", color = "yellow" } },
    })
  end,
}
