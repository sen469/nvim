# Neovim Configuration

## 別のマシンで必要なツールを確認する

Neovim 内で `:CheckTools`（または `:checkhealth nvim_tools`）を実行すると、
外部ツールの用途・導入状況・検出パスを表示します。
手動導入するもの、機能を使う場合だけ必要なもの、Mason 管理のものに分けています。
インストールは行いません。

プラグイン導入前や通常起動できない場合は、このディレクトリで次を実行できます。
Neovim 自体は先にインストールしてください。

```sh
nvim --headless -u NONE -i NONE -l scripts/check-tools.lua
```

基本的な対象は `git`、`zsh`、`rg`（ripgrep）、`make`、`cc`（C コンパイラ）、
`curl` または `wget`、`tar`、`gzip`、`unzip`、`node`、`npm` です。
クリップボードは現在 `xsel`（X11）に固定されているため、Wayland/macOS では
`lua/options.lua` のクリップボード設定も変更してください。
アイコンには端末側の Nerd Font、MarkdownPreview にはブラウザが必要です。

一覧は `lua/nvim_tools/init.lua` で管理しています（設定の自動解析ではありません）。
外部依存を変更したときは一覧も更新してください。
チェックは実行ファイルの存在を調べるもので、バージョンや動作までは保証しません。

## Neovim Keybindings

This file documents all the keybindings configured in this Neovim setup. They are grouped by configuration file and plugin.

## General Keymaps (`lua/keymaps.lua`)

### Telescope
| Key | Mode | Description |
|---|---|---|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep |
| `<leader>fb` | Normal | Search buffers |
| `<leader>fh` | Normal | Search help tags |

### Window/Split Management
| Key | Mode | Description |
|---|---|---|
| `ss` | Normal | Split window horizontally |
| `sv` | Normal | Split window vertically |
| `sh` | Normal | Move focus to the left split |
| `sj` | Normal | Move focus to the down split |
| `sk` | Normal | Move focus to the up split |
| `sl` | Normal | Move focus to the right split |

### Insert Mode
| Key | Mode | Description |
|---|---|---|
| `jk` | Insert | Exit insert mode |
| `<C-l>` | Insert | Convert the previous word to uppercase |

### File/Buffer Management
| Key | Mode | Description |
|---|---|---|
| `<F1>` | Normal | Edit Neovim configuration (`init.lua`) |
| `<leader>e` | Normal | Toggle file explorer (Neo-tree) |
| `cpal` | Normal | Copy all content of the buffer |
| `clr` | Normal | Clear all content of the buffer |
| `<Tab>` | Normal | Go to the next buffer |
| `<S-Tab>` | Normal | Go to the previous buffer |
| `<leader>bd` | Normal | Delete the current buffer |
| `<leader>bc` | Normal | Choose a buffer to close |
| `<leader>bo` | Normal | Close all other buffers |
| `<leader>bl` | Normal | Close all buffers to the left |
| `<leader>br` | Normal | Close all buffers to the right |
| `<leader>1` - `<leader>5` | Normal | Jump to buffer 1 through 5 |

### Debugging (DAP)
| Key | Mode | Description |
|---|---|---|
| `<F5>` | Normal | Continue execution |
| `<F10>` | Normal | Step over |
| `<F11>` | Normal | Step into |
| `<F12>` | Normal | Step out |
| `<leader>b` | Normal | Toggle breakpoint |
| `<leader>B` | Normal | Set conditional breakpoint |
| `<leader>dr` | Normal | Open DAP REPL |
| `<leader>du` | Normal | Toggle DAP UI |

---

## Plugin Keymaps

### 42-header (`plugins/42-header.lua`)
| Key | Mode | Description |
|---|---|---|
| `<F1>` | Normal | Inserts or updates the 42 header |

### DAP (`plugins/dap.lua`)
*These keymaps are active only during a DAP debug session.*
| Key | Mode | Description |
|---|---|---|
| `K` | Normal | Show variable info under cursor (hover) |
| `<Esc>`| Normal | Close all DAP hover windows |

### dial.nvim (`plugins/dial.lua`)
| Key | Mode | Description |
|---|---|---|
| `<C-a>` | Normal / Visual | Increment number/date/etc. |
| `<C-x>` | Normal / Visual | Decrement number/date/etc. |
| `g<C-a>` | Visual | Increment number/date/etc. (grouped) |
| `g<C-x>` | Visual | Decrement number/date/etc. (grouped) |

### neo-tree.nvim (`plugins/nvim-neo-tree.lua`)
*These keymaps are active only within the Neo-tree window.*
| Key | Mode | Description |
|---|---|---|
| `<CR>` / `o` | Normal | Open file or directory |
| `s` | Normal | Open file in a vertical split |
| `i` | Normal | Open file in a horizontal split |
| `R` | Normal | Refresh the tree |
| `q` | Normal | Close the Neo-tree window |
| `<Tab>`| Normal | Preview file |

### toggleterm.nvim (`plugins/toggleterm.lua`)
| Key | Mode | Description |
|---|---|---|
| `<c-\>` | Normal | Toggle terminal |

### treesj (`plugins/treesj.lua`)
| Key | Mode | Description |
|---|---|---|
| `<leader>m` | Normal | Toggle join/split code block |
| `<leader>j` | Normal | Join code block into one line |
| `<leader>s` | Normal | Split code block into multiple lines |
