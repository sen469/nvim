" --- 外観・表示設定 ---
set fenc=utf-8            " 文字コードをUTF-8に設定
set number
set relativenumber
set showmatch
set cursorline
set ruler
set laststatus=2          " ステータスラインを常に表示
syntax on
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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
set autoread
set history=1000
set clipboard=unnamedplus " システムクリップボードを使用
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p

" --- バックアップ・スワップ設定 ---
set noswapfile
set nobackup
set nowritebackup

set list
set listchars=tab:\▸\-    " タブを「▸-」で表示
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

" " ====================================
" " 基本設定
" " ====================================
" set nobackup              " バックアップファイルを作らない
" set noswapfile            " スワップファイルを作らない
" set autoread              " 編集中のファイルが変更されたら自動で読み直す
" set autowrite             " 自動保存
" set hidden                " バッファが編集中でも他のファイルを開けるように
" set history=1000          " コマンド履歴の最大数
" 
" " ====================================
" " 見た目
" " ====================================
" set number                " 行番号を表示
" set relativenumber        " 相対行番号を表示
" " カーソル行を強調
" set cursorline
" " 行番号だけ強調
" set cursorlineopt=both
" " 相対行番号はデフォルト色のまま
" highlight LineNr ctermfg=gray guifg=#aaaaaa
" " カーソル行番号だけ黄色に
" highlight CursorLineNr ctermfg=Yellow guifg=Yellow
" " カーソル行全体に下線を付ける
" highlight CursorLine cterm=underline guibg=NONE gui=underline
" set ruler                 " ルーラーを表示
" set showmatch             " 対応する括弧を表示
" set wildmode=list:longest " コマンドライン補完
" " Visualモードの配色：背景を白、文字を黒
" highlight Visual ctermfg=0 ctermbg=15 guifg=#000000 guibg=#ffffff
" syntax enable             " シンタックスハイライト有効化
" 
" " テーマ変更
" colorscheme habamax
" 
" " ====================================
" " インデント・タブ
" " ====================================
" set smartindent           " スマートインデント
" set noexpandtab           " Tab をスペースに変換しない (Ubuntu優先)
" set tabstop=4             " Tabの表示幅
" set shiftwidth=4          " 自動インデント幅
" set list                  " 不可視文字を可視化
" 
" " ====================================
" " 検索
" " ====================================
" set ignorecase            " 小文字検索時は大文字小文字を区別しない
" set smartcase             " 大文字を含む検索は区別する
" set incsearch             " インクリメンタルサーチ
" set wrapscan              " 最後まで行ったら先頭に戻る
" set hlsearch              " 検索結果をハイライト表示
" 
" " ESC連打でハイライト解除
" 
" " ====================================
" " クリップボード連携
" " ====================================
" 
" " ====================================
" " マウス
" " ====================================
" set mouse=a
" 
" " ====================================
" " ファイルタイプ検出 & プラグイン
" " ====================================
" filetype plugin indent on

