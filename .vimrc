set rtp+=~/dotfiles/.vim/bundle/vundle/
call vundle#rc()
" My Bundles here
Bundle 'unite.vim'
Bundle 'git@github.com:SpringMT/unite-outline.git'
Bundle 'git@github.com:SpringMT/AutoComplPop.git'
Bundle 'git@github.com:SpringMT/mru.vim.git'

"-----------------------------
" base setting
"-----------------------------
"カラースキーマを設定
"colorscheme ron
"colorscheme darkblue
"colorscheme elflord
"colorscheme molokai
" 暗い配色にする
set background=dark
"viとの互換性をとらない
set nocompatible
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  " シンタックスハイライトを有効にする
  syntax on
  " 検索結果文字列のハイライトを有効にする
  set hlsearch
endif

" 全モードでマウスを有効化
"set mouse=a

" backup(mkdir ~/.vim mkdir ~/.vim/backup mkdir ~/.vim/swap)
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap
set viminfo+=n~/.vim/.viminfo

"コマンドを自動的に実行する
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.(最後のカーソル位置に移動)
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

"-----------------------------
" apperance
"-----------------------------
" タイトルをウインドウ枠に表示する
set title
" タイトルの文字列
"set titlestring=haru

"バイナリファイルの非印字可能文字を16進数で表示
set display=uhex

" 行番号を表示する
"set number
" ルーラーを表示
set ruler
" ルーラの内容を指定する書式は 'statusline' のものと同様
set ruf=%45(%12f%=\ %m%{'['.(&fenc!=''?&fenc:&enc).']'}\ %l-%v\ %p%%\ [%02B]%)
"999 行, 888 文字" の代わりに "999L, 888C" を表示。
set shortmess+=I

" 入力中のコマンドをステータスに表示する
set showcmd
"コマンドラインに使われるスクリーン上の行数
set cmdheight=2

"カーソルの上または下に表示する最小限の行数
set scrolloff=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2
" ステータスラインに表示する情報の指定
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
" ステータスラインの色
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
 set wrap

" fileencodings の設定を前から順に試してはじめにマッチしたものが採用される
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932
" fileencoding=utf-8で編集中、□や○があるとその行でカーソル位置がずれる問題があったのだが、解決する設定（ambiwidth=double）
if &encoding == 'utf-8'
  set ambiwidth=double
  " 全角スペースの表示
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
  match ZenkakuSpace /　/
endif

" カーソル行をハイライト
  set cursorline
  " カレントウィンドウにのみ罫線を引く
  augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
  augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine cterm=bold ctermbg=black guibg=black

"-----------------------------
" compl
"-----------------------------
autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
" ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666 guifg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333 guifg=#666666
highlight Pmenu ctermbg=0
highlight PmenuSel ctermbg=4
highlight PMenuSbar ctermbg=0
inoremap ,s <ESC>:AutoComplPopDisable<CR>a
inoremap ,q <ESC>:AutoComplPopEnable<CR>a
nnoremap ,s :AutoComplPopDisable<CR>
nnoremap ,q :AutoComplPopEnable<CR>
inoremap <expr> ,t
            \ (exists('#AcpGlobalAutoCommand#InsertEnter#*')) ? "\<C-o>:AutoComplPopDisable\<CR>" : "\<C-o>:AutoComplPopEnable\<CR>"

"-----------------------------
" edit
"-----------------------------
" 括弧にカーソルが移ると対括弧がハイライト表示
set showmatch
"バックスペースにてインデントを削除可能にする
" indent : 行頭の空白
" eol : 改行
" start : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
"クリップボードを使用(vimエディタが「+clipboard」でコンパイルされていること :versionで確認)
set clipboard=unnamed
"paste をオンにすれば autoindent がオフの状態のトグル
set pastetoggle=<F2>
"GUI用のオプション
"a:ビジュアルモードで選択した文字がシステムのクリップボードに入る。他のアプリケーションとクリップボードを共有するオプション。
set guioptions+=a
"補完候補を表示する。コマンドライン補完が拡張モードで行われる
set wildmenu
"Vimがテキストを整形する方法を決定するオプション
set formatoptions+=M

" ---indent---
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
" オートインデントを有効にする（新しい行のインデントを現在の行と同じにする）
set autoindent
"C言語スタイルのインデント機能が有効
"set cindent
" タブが対応する空白の数
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使う
set expandtab

" #### putline ####(\lineと打つ)
let putline_tw = 30

inoremap <Leader>line <ESC>:call <SID>PutLine(putline_tw)<CR>A
function! s:PutLine(len)
  let plen = a:len - strlen(getline('.'))
  if (plen > 0)
    execute 'normal ' plen . 'A-'
  endif
endfunction

"-----------------------------
" search
"-----------------------------
"検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
"set incsearch
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
"set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチ(検索文字を打ち込むと即検索)を使わない
set noincsearch
"ビジュアルで選択検索
vnoremap * "zy:let @/ = @z<CR>n

"-----------------------------
" perl 関連
"-----------------------------
"コンパイラの指定
autocmd FileType perl,cgi :compiler perl

":w + !perl command (<CR>はキャリッジリターン :help keycodes )
map <F4>  :w !perl<CR>
"!perl command
map <F5>  :!perl %<CR>

augroup SkeletonAu
    autocmd!
    autocmd BufNewFile *.pl 0r $HOME/dotfiles/.vim/skel/skel.pl
    autocmd BufNewFile *.pm 0r $HOME/dotfiles/.vim/skel/skel.pm
    autocmd BufNewFile 00-compile.t 0r $HOME/dotfiles/.vim/skel/skel_00-compile.t
    autocmd BufNewFile 01-call_func.t 0r $HOME/dotfiles/.vim/skel/skel_01-call_func.t
    autocmd BufNewFile \%(00-compile\|01\-call_func)\@!*.t 0r $HOME/dotfiles/.vim/skel/skel.t
augroup END

"-----------------------------
" keymap
"-----------------------------
" inoremap インサートモード
" vnoremap ビジュアルモード
" nnoremap normalモード
nnoremap j gj
nnoremap k gk
"ブラウザと同じ操作 スペースでダウンアップ
nnoremap <Space>  <C-E>
nnoremap <S-Space> <C-Y>
" brackets
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap <> <><LEFT>

" ---Emacs風味---
" コマンド入力中断
imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" 画面分割
imap <silent> <C-x>1 <ESC>:only<CR>i
imap <silent> <C-x>2 <ESC>:sp<CR>i
imap <silent> <C-x>3 <ESC>:vsp<CR>i
imap <silent> <C-x>o <ESC><C-w>w<CR>i
imap <silent> <C-x>p <ESC><C-w>p<CR>i

" 消去、編集
imap <C-k> <ESC>d$i
"cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" 移動
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-n>  <Down>
imap <C-p>  <UP>
"imap <ESC>< <ESC>ggi
"imap <ESC>> <ESC>Gi

" ファイル
imap <C-c><C-c>  <ESC>:qa<CR>
imap <C-x><C-c>  <ESC>:qa!<CR>
imap <C-w><C-w>  <ESC>:w<CR>
imap <C-x><C-w>  <ESC>:w!<CR>
imap <C-x><C-f>  <ESC>:e 

" エラーリカバリ
 imap <C-/> <ESC>ui

" その他
"ウィンドウを縦に分割して、左側にExploreを起動
map  <C-x><C-e> :Vexplore<CR>
map <F6>  <ESC>:set encoding=utf8<CR>
