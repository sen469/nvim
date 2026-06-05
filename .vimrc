" --- 外観・表示設定 ---
set number
set relativenumber
set showmatch
set cursorline
set ruler
syntax on

" --- インデント・タブ設定 ---
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

filetype plugin indent on

" --- 検索設定 ---
set ignorecase
set smartcase
set incsearch
set hlsearch

" --- システム連携・その他 ---
set mouse=a
set clipboard+=unnamed
set autoread
set history=1000

" --- バックアップ・スワップ設定 ---
set noswapfile
set nobackup
set nowritebackup

set list
set listchars=tab:^-
" --------------------------------------------------
" habamaxをone-monokai風にする設定
" --------------------------------------------------
" カラーパレット (参考):
" orange_red: #E06C75, purple: #C678DD, cyan: #56B6C2, blue: #61AFEF
" white: #BBBBBB, orange: #E5C07B, green: #98C379

" UI関連
autocmd ColorScheme habamax highlight CursorLine guibg=#4B5263 ctermbg=darkgray
autocmd ColorScheme habamax highlight CursorColumn guibg=#4B5263 ctermbg=darkgray
autocmd ColorScheme habamax highlight CursorLineNr guifg=#ffff80 gui=bold ctermfg=yellow cterm=bold

" 補完メニュー
autocmd ColorScheme habamax highlight Pmenu guifg=#ABB2BF guibg=#21252B
autocmd ColorScheme habamax highlight PmenuSel guifg=#282C34 guibg=#61AFEF gui=bold
autocmd ColorScheme habamax highlight PmenuSbar guibg=#2C313A
autocmd ColorScheme habamax highlight PmenuThumb guibg=#5C6370

" 構文ハイライト
autocmd ColorScheme habamax highlight Comment guifg=#858557 gui=italic ctermfg=darkgray cterm=italic
autocmd ColorScheme habamax highlight Statement guifg=#E06C75 ctermfg=red
autocmd ColorScheme habamax highlight PreProc guifg=#98C379 ctermfg=green
autocmd ColorScheme habamax highlight Type guifg=#56B6C2 ctermfg=cyan
autocmd ColorScheme habamax highlight Constant guifg=#C678DD ctermfg=magenta
autocmd ColorScheme habamax highlight Number guifg=#C678DD ctermfg=magenta
autocmd ColorScheme habamax highlight Identifier guifg=#BBBBBB ctermfg=white
autocmd ColorScheme habamax highlight Function guifg=#98C379 ctermfg=green
autocmd ColorScheme habamax highlight String guifg=#E5C07B ctermfg=yellow
autocmd ColorScheme habamax highlight Special guifg=#61AFEF ctermfg=blue

" 背景透明にする
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight FoldColumn ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight WinSeparator ctermbg=NONE guibg=NONE

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme habamax
