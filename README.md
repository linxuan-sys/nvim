# Neovim 配置说明

基础框架：[LazyVim](https://github.com/LazyVim/LazyVim)（v16 系列，Neovim ≥ 0.11）
插件管理：[lazy.nvim](https://github.com/folke/lazy.nvim)
当前插件数：50

---

## 一、这套配置的特点

1. **不手写插件配置**：绝大部分能力通过 `:LazyExtras` 勾选官方预设获得（见 `lazyvim.json`），自己只改了 7 个文件。
2. **全中文菜单**：`lua/plugins/lazyvim-zh.lua` 把 which-key 的所有描述翻成中文并补图标，只改文字不碰快捷键，删掉即恢复英文。
3. **Python 用 basedpyright**，inlay hints 默认关闭（`<leader>uh` 切换）。
4. **关掉了几处「烦人」的默认行为**：注释不自动延续、不做拼写检查、关掉 LSP 进度条弹窗。
5. **失焦/切 buffer 自动保存**（`autowriteall`）。
6. **两套自定义工具**：HTML 浏览器实时预览（`:HtmlPreview`）、空格 t 开多实例终端。

---

## 二、启用的 LazyVim Extras

配置位置：`lazyvim.json`

| Extra | 作用 |
|---|---|
| `ai.copilot` | GitHub Copilot 行内补全 |
| `ai.sidekick` | **在 nvim 内嵌 opencode / claude 等 AI CLI**，可把选中代码直接发过去 |
| `dap.core` | 断点调试框架（nvim-dap） |
| `editor.mini-diff` | 边栏改动标记（替代 gitsigns） |
| `lang.clangd` | C/C++ 语言支持 |
| `lang.rust` | Rust 语言支持（rustaceanvim） |
| `lang.python` | Python 语言支持 |
| `lang.json` | JSON + Schema 补全 |
| `lang.markdown` | Markdown 支持 + 预览 |
| `lang.toml` | TOML 支持 |
| `lang.typst` | Typst 排版语言 + 实时预览 |

---

## 三、插件清单（按用途分类）

### 核心

| 插件 | 说明 |
|---|---|
| `LazyVim` | 配置框架本体 |
| `lazy.nvim` | 插件管理器，`:Lazy` 打开界面 |
| `plenary.nvim` | 通用 Lua 工具库（很多插件依赖） |
| `nui.nvim` | UI 组件库（noice 依赖） |
| `nvim-nio` | 异步 IO 库 |
| `which-key.nvim` | 按键提示菜单，本机已中文化 |

### 外观

| 插件 | 说明 |
|---|---|
| `catppuccin` | **当前配色**（mocha 系） |
| `tokyonight.nvim` | 备用配色（启动兜底） |
| `bufferline.nvim` | 顶部 buffer 标签栏，设为**常显** |
| `lualine.nvim` | 底部状态栏 |
| `mini.icons` | 文件类型图标 |
| `noice.nvim` | 重写命令行/消息/通知 UI，**关掉了 LSP 进度弹窗** |
| `snacks.nvim` | **一站式全家桶**：选择器、首页 Dashboard、终端、图片预览 |
| `trouble.nvim` | 诊断/引用列表侧栏 |
| `todo-comments.nvim` | 高亮 TODO / FIXME / NOTE |
| `render-markdown.nvim` | 直接在编辑区渲染 Markdown 样式 |
| `ts-comments.nvim` | 用 treesitter 判断注释符号（避免嵌在 JS 里的 CSS 注释错） |

### 编辑增强

| 插件 | 说明 |
|---|---|
| `flash.nvim` | 用字符跳转快速移动光标（`s` 键） |
| `mini.ai` | 增强 `a`/`i` 文本对象（如 `ciq` 改引号内容） |
| `mini.pairs` | 括号/引号自动配对 |
| `grug-far.nvim` | 项目级搜索替换界面 |
| `nvim-treesitter` | 语法解析，提供高亮/缩进/折叠 |
| `nvim-treesitter-textobjects` | 按函数/类/参数跳转和选择 |
| `nvim-ts-autotag` | HTML/JSX 标签自动闭合与重命名同步 |
| `persistence.nvim` | 会话保存/恢复 |

### 补全与 AI

| 插件 | 说明 |
|---|---|
| `blink.cmp` | **补全引擎**（替代 nvim-cmp，Rust 实现，快） |
| `friendly-snippets` | 现成代码片段库 |
| `copilot.lua` | Copilot 补全内核 |
| `blink-copilot` | 让 Copilot 接入 blink.cmp 的补全列表 |
| `sidekick.nvim` | **在 nvim 内嵌 AI CLI**（opencode / claude / codex…），支持把选中代码发过去、接受/拒绝它改的代码 |
| `lazydev.nvim` | 写 nvim 配置时的 Lua LSP 增强 |

### LSP / 补全 / 诊断

| 插件 | 说明 |
|---|---|
| `nvim-lspconfig` | LSP 配置集合 |
| `mason.nvim` | LSP/格式化器/调试器安装器 |
| `mason-lspconfig.nvim` | 把 mason 装的 LSP 接给 lspconfig |
| `SchemaStore.nvim` | JSON/YAML 的 schema 来源 |
| `conform.nvim` | **格式化**（保存时自动执行） |
| `nvim-lint` | 代码检查（linter） |

### 调试（DAP）

| 插件 | 说明 |
|---|---|
| `nvim-dap` | 调试核心 |
| `nvim-dap-ui` | 调试界面（变量/断点/调用栈面板） |
| `nvim-dap-virtual-text` | 行内显示变量当前值 |
| `nvim-dap-python` | Python 调试适配 |
| `mason-nvim-dap.nvim` | 自动安装调试适配器 |

### Git

| 插件 | 说明 |
|---|---|
| `mini.diff` | **边栏显示改动 + 跳转/暂存 hunk**（`]h` `[h` `gh` `gH`） |
| `gitsigns.nvim` | 已由 mini-diff 自动禁用，仅 `lazy-lock.json` 残留记录 |

> 完整 Git 操作（stage/unstage/blame/历史/push）走 lazygit：`<leader>gg`

### 语言专项

| 插件 | 语言 |
|---|---|
| `rustaceanvim` | Rust LSP/调试/测试一体 |
| `crates.nvim` | Rust：`Cargo.toml` 里依赖版本补全与更新提示 |
| `clangd_extensions.nvim` | C/C++：clangd 增强（内存用量、类型层级） |
| `venv-selector.nvim` | Python：切换虚拟环境 |
| `typst-preview.nvim` | Typst：浏览器实时预览 |
| `markdown-preview.nvim` | Markdown：浏览器预览 |

---

## 四、本机自定义的部分（7 个文件）

| 文件 | 干了什么 |
|---|---|
| `init.lua` | 启动入口；开启 `autowriteall` 自动保存；加载 HTML 预览 |
| `lua/config/lazy.lua` | lazy.nvim 引导；关闭 gzip/tar/zip 等内置插件加速启动 |
| `lua/config/options.lua` | Python 用 basedpyright；关注释延续；方向键可跨行；默认自动换行；`scrolloff=2` |
| `lua/config/keymaps.lua` | 插入/可视模式连按 `pp` = Esc；普通/命令模式 `\` 保存 |
| `lua/config/autocmds.lua` | 删掉 LazyVim 的拼写检查；全局禁注释延续 |
| `lua/config/html_preview.lua` | **自写功能**：`:HtmlPreview` 起本地 HTTP 服务，浏览器边打字边刷新（不落盘，靠哈希分配端口） |
| `lua/plugins/lazyvim-zh.lua` | **1255 行**：which-key 全量中文化 + 图标继承，只改描述不动逻辑 |

### 各 plugin 覆盖文件

| 文件 | 改了什么 |
|---|---|
| `lua/plugins/snacks.lua` | 首页 Dashboard（ASCII 头像 + 快捷键/最近文件/项目/Git 状态四栏）、文件选择器显示隐藏文件、终端、图片/PDF 预览、`<leader>t` 多实例终端 |
| `lua/plugins/lsp.lua` | 默认关闭 inlay hints |
| `lua/plugins/noice.lua` | 关闭 LSP 进度提示 |
| `lua/plugins/bufferline.lua` | bufferline 常显 |
| `lua/plugins/catppuccin.lua` | 用 catppuccin 官方 `load()` 而非内置主题名 |
| `lua/plugins/example.lua` | LazyVim 模板，首行 `if true then return {} end`，**不加载任何内容**，可删 |

---

## 五、常用快捷键速查

### 通用

| 键 | 作用 |
|---|---|
| `\` | 保存（普通/命令模式） |
| `pp` | Esc（插入/可视模式） |
| `<leader>t` | 打开终端（数字前缀开多个） |
| `:HtmlPreview` | HTML 实时预览 |

### 查找 / 文件

| 键 | 作用 |
|---|---|
| `<leader><space>` | 找文件 |
| `<leader>/` | 全项目搜索文本 |
| `<leader>sg` / `<leader>sw` | grep / 搜当前词 |
| `<leader>sr` | 项目级搜索替换（grug-far） |
| `s` | flash 字符跳转 |

### Git

| 键 | 作用 |
|---|---|
| `<leader>gg` / `<leader>gG` | lazygit（项目根 / 当前目录） |
| `]h` / `[h` | 下一处 / 上一处改动 |
| `gh` / `gH` | 暂存 / 丢弃当前 hunk |
| `<leader>go` | 行内 diff 叠加显示 |
| `<leader>gb` | 当前行 blame |
| `<leader>gl` / `<leader>gf` | 提交历史 / 当前文件历史 |
| `<leader>gs` / `<leader>gd` | git status / diff |

### AI

| 键 | 作用 |
|---|---|
| `<leader>aa` | 打开/隐藏 AI CLI 侧边栏 |
| `<C-.>` | 在代码与 AI 侧栏之间跳 |
| `<leader>at` | 把当前行 / 选中代码发给 AI |
| `<leader>af` / `<leader>av` | 发整个文件 / 只发选区文本 |
| `<leader>ap` | 预设提示词菜单 |
| `<leader>as` | 选择用哪个 CLI |

### 调试 / 诊断

| 键 | 作用 |
|---|---|
| `<F5>` | 启动/继续调试 |
| `<leader>db` | 切换断点 |
| `<leader>du` | 打开调试界面 |
| `<leader>xx` | 诊断列表（trouble） |
| `<leader>uh` | 切换 inlay hints |
| `<leader>uf` | 切换保存自动格式化 |

### 界面开关

| 键 | 作用 |
|---|---|
| `<leader>uG` | 显示/隐藏 diff 标记 |
| `<leader>us` | 拼写检查 |
| `<leader>uw` | 自动换行 |
| `<leader>ul` | 行号 |

---

## 六、维护

```vim
:Lazy            " 插件管理界面（更新 / 清理 / 性能分析）
:LazyExtras      " 勾选/取消 LazyVim 预设
:Mason           " 安装 LSP / 格式化器 / 调试器
:checkhealth     " 全面体检
:TSUpdate        " 更新 treesitter 解析器
```

- `lazy-lock.json` 记录所有插件的精确 commit，**保证可复现**
- 想临时关掉某个插件：在对应 spec 里加 `enabled = false`
- 想恢复英文菜单：删掉 `lua/plugins/lazyvim-zh.lua`
