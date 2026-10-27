return {
  "folke/sidekick.nvim",
  keys = {
    {
      "<leader>aa",
      function()
        local Session = require("sidekick.cli.session")
        Session.setup() -- 先加载 tools，否则后端会在下面被重新注册
        Session.backends.opencode = nil -- 去掉 opencode serve 的会话后端，只留本地终端
        require("sidekick.cli").toggle("opencode")
      end,
      desc = "Opencode",
    },
  },
}
