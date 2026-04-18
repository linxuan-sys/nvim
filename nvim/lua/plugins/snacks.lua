return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true, -- 显示隐藏文件
        },
      },
    },

    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                             @临轩linxuan_bilibili
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠶⠶⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠉⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⢠⣤⣤⡄⢀⣤⣤⣄⠀⠹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⣿⣿⣿⡿⢸⣿⣿⣿⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣄  ⠀   ⢠⡇⠀⠀⠈⠛⠛⠁⠀⠙⠛⠋⠀⠀⠈⣧⠀⠀⠀ ⡔ ⠀⠀⠀
⢀⡤⠙⢷⣦   ⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡆⠀⠀⠀⠈⢙⣲⣶⠀
 ⣴⣾⣿⡋   ⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠀⠰⢿⣿⠿⠁ 
 ⠙⠛⠿⠛⠀  ⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⠀⠀⠀⠀⠀ ⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⡆⢻⡄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠘⠂⢷⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⠃⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⢻⠀⢂⠀⠀⠀⠀⠻⣆⠀⠀⠀
⠀⠀⠀⢀⡾⠃⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀ ⢸⣿⠀⠀⢸⠀⠘⠂⠀⠀⠀⠀⠈⢳⣄⠀
⠀⠀⢀⡞⠁⠀⠸⠷⢰⠁⠀⠀⠀⠀⠀⠀⠀  ⢸⣿⠀⠈⡄⠀⠀⣤⠄⠀⢀⣠⠏⢹⡆
⠀⣴⡟⣀⠀⠀⠷⢀⠃⠀⠀⠀⣤⡀⠀⠀⠀⢸⣿⠀⠀⠀⠀⡇⠀⠀⢰⡟⠋⠁⠀⣠⡞⠀
 ⠻⣧⣿⣧⣜⠃⡘⠀⠀⠀⢠⣿⠇⠀⠀⠀ ⢸⣿⠀⠀⠀⠃⠀⠀⢸⣇⣀⣀⡼⠋$⠀
⠀⠀⠘⢿⣿⡏⠐⢁⠄⠀⠀⠸⡷⠀⠀⠀⠀ ⢸⣿⠀⠀⠀⠀⠀⠀⠀⠘⢻⣿⡇⠀⠀⠀
$⠀⢠⣿⠋⠀⠀⡌⠀⠀⣸⣿⠄⠀⠀⠀⠀⠸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⡇⠀⠀⠀
⠀⠀⡌⠀⠺⠃⠀⠀⠀⢀⣿⠏⠀⠀⠀⠀⠀⠿⠆  ⠀⠀⠀⣆⠀⠀⢰⡎⣿⡇⠀$⠀
⠀⠀⢦⣄⠀⠀⠀⠀⠀⣾⠟⠀⠀$⠀⠀⠺⠇⠀⠀⠀⠀⢹⠀⠀⠀⠀⢸⣷⠻⣷⠀⠀⠀
⠀⠀⠀⠉⠲⠶⣤⣤⣶⠆⠀⠀⠀⠀⠀⣼⡟⠀⠀⠀$⠀⠸⡄⠀⠀⠀⢸⣿⣶⣿⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⠛⣃⠀⠀⠀⣀⡀⠀⣿⣧⣄⡀⠀⠀⠀⠀⡇⠀⠀⠀⢸⣿⠉⠉⠀⠀⠀
⠀⠀$⠀⠀⠀⣿⠀⠈⠉⠉⠉⠉⠉⠁⠉⠉⠉⠉⢳⣤⡄⠀⠃⠀⠀⠀⠸⣿⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢻⣄⠀⠀⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⢈⣡⣤⡀⠀⠀⠀⣿⠀⠀⠀⠀⠀
⠀⠀⠀$⠀⠀⠀⠉⠉⠳⠶⠶⠞⠁⠈⢧⡀⠀⠀⣠⡴⠋⠀⠈⠹⢧⣄⣠⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠒⠛⠁⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀$⠀⠀⠀
          $                       
                    $             
                                  
Don't touch the ghost or it'll haunt you
]],
      },
      sections = {
        {
          --icon = " ",
          key = "e",
          --desc = "Explorer",
          action = ":lua Snacks.explorer({ cwd = LazyVim.root() })",
        },
        { section = "header" },
        { pane = 2, icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return require("snacks.git").get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { pane = 2, section = "startup" },
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
  },
  -- 设置 Dashboard 自定义颜色
  config = function(_, opts)
    -- 先初始化 snacks
    require("snacks").setup(opts)

    -- Dashboard 颜色设置
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
      fg = "#e9edf8",
      bold = true,
    })
    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", {
      fg = "#8EB8F2",
      bold = true,
    })
    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
      fg = "#d7c6ff",
      bold = true,
    })
    vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
      fg = "#fe9550",
      bold = true,
    })
  end,
}
