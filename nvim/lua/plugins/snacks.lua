return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
 ██╗     ██╗███╗   ██╗██╗  ██╗██╗   ██╗ █████╗ ███╗   ██╗
 ██║     ██║████╗  ██║╚██╗██╔╝██║   ██║██╔══██╗████╗  ██║
 ██║     ██║██╔██╗ ██║ ╚███╔╝ ██║   ██║███████║██╔██╗ ██║
 ██║     ██║██║╚██╗██║ ██╔██╗ ██║   ██║██╔══██║██║╚██╗██║
 ███████╗██║██║ ╚████║██╔╝ ██╗╚██████╔╝██║  ██║██║ ╚████║
 ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝
                                    @临轩linxuan_bilibili 
]],
      },
    },
    image = {
      enabled = true,
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "svg",
        "ico",
        "avif",
        "cur",
        "tiff",
        "tif",
        "ppm",
        "pgm",
        "pbm",
        "apng",
        "pdf",
      },
      convert = {
        magick = {
          pdf = {
            "-density",
            "192",
            "{src}[{page}]",
            "-background",
            "white",
            "-alpha",
            "remove",
            "-trim",
          },
        },
      },
      doc = {
        enabled = true,
        inline = true,
        float = true,
      },
    },

    terminal = {
      enabled = true,
      win = { style = "terminal" },
    },
    zen = {
      enabled = true,
    },
    dim = {
      enabled = true,
    },
  },
  keys = {
    -- 空格 + t 切换终端（支持数字前缀切换不同实例）
    {
      "<leader>t",
      function()
        local count = vim.v.count1
        Snacks.terminal(nil, { count = count })
      end,
      desc = "Terminal",
    },
    -- Leader+z 切换 Zen 专注模式
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    -- Leader+D 切换 Dim 模式（默认关闭，手动开启）
    {
      "<leader>D",
      function()
        if vim.g.snacks_dim_enabled then
          Snacks.dim.disable()
          vim.g.snacks_dim_enabled = false
          print("Dim disabled")
        else
          Snacks.dim.enable()
          vim.g.snacks_dim_enabled = true
          print("Dim enabled")
        end
      end,
      desc = "Toggle Dim",
    },
  },
}
