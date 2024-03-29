if &compatible
    set nocompatible
endif


set runtimepath+=~/.vim

" Setting Dir

set undodir=~/.vim/undo
set backupdir=~/.vim/backup
set directory=~/.vim/swap


" Setting Encodings and Formats

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos,mac
set ambiwidth=double
set formatoptions+=mMj


" Setting Title and CommandLine

set showcmd
set title
set ruler
set cmdheight=2
set laststatus=2
set showtabline=1
set number


" Setting Visibility of TAB RETURN EOL SPACE etc

set list
set listchars=tab:^-,trail:~,eol:↲,extends:»,precedes:«,nbsp:%
set showbreak=↪


" Setting TAB and Indent

filetype plugin indent on
set autoindent
set smartindent
" set breakindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4


" Setting Behavior of Cursor

set whichwrap=h,l,<,>,b,[,]
set backspace=indent,eol,start


" Setting Search

set nowrapscan
set incsearch
set ignorecase
set smartcase
set hlsearch


" Setting Parens

set showmatch
set matchpairs+=（:）,「:」,『:』,｛:｝
set matchtime=1

source $VIMRUNTIME/macros/matchit.vim
runtime ftplugin/man.vim


" Disable Auto Indent When Paste Characters

if &term =~ 'xterm' || &term =~ 'screen'
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


" Setting Mouse Control

if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


" Other Settings

set wildmenu
set wildmode=list:longest,full
set scrolloff=4
set iminsert=0
set display=lastline
set pumheight=30
set ttimeoutlen=30
set hidden              " allow buffers hide from screen without saving
set updatetime=100
" set signcolumn=yes
set conceallevel=0


" Setting Sessions

set sessionoptions-=options
if has('win32')
    set sessionoptions+=slash
    set sessionoptions+=unix
endif



nnoremap Y y$


inoremap <C-b> <Left>
inoremap <C-f> <Right>


function! ToggleCursorLineAndColumn()
    if &cursorcolumn && &cursorline
        set nocursorline
        set nocursorcolumn
    else
        set cursorline
        set cursorcolumn
    endif
endfunction

function! ToggleBackground()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

function! ToggleConcealLevel()
    if &conceallevel == 0
        set conceallevel=2
    else
        set conceallevel=0
    endif
endfunction

nnoremap <Space>tl :<C-u>set cul!<CR>
nnoremap <Space>tc :<C-u>set cuc!<CR>
nnoremap <Space>tw :<C-u>set wrap!<CR>
nnoremap <Space>tb :<C-u>call ToggleCursorLineAndColumn()<CR>
nnoremap <Space>tB :<C-u>call ToggleBackground()<CR>
nnoremap <Space>tS :<C-u>set spell!<CR>
nnoremap <Space>tC :<C-u>call ToggleConcealLevel()<CR>
nnoremap <Space>ms :<C-u>mks! Session.vim<CR>
nnoremap /  /\v
nnoremap // /\V
nnoremap ?  ?\v
nnoremap ?/ ?\V
nnoremap <silent><Esc><Esc> :<C-u>noh<CR><ESC>


command! -count=1 Glo :r! git log --oneline --no-merges -<count>
set shortmess+=a
set shortmess-=w
set shortmess-=c


command! -range WhiteSpaceToTab :<line1>,<line2>s/    /\t/g

nnoremap <Space><Space>s  :<C-u>source Session.vim<CR>

" search motions with digraphs
nnoremap <Space><Space>f f<C-k>
nnoremap <Space><Space>t t<C-k>
nnoremap <Space><Space>F F<C-k>
nnoremap <Space><Space>T T<C-k>
onoremap <Space><Space>f f<C-k>
onoremap <Space><Space>t t<C-k>
onoremap <Space><Space>F F<C-k>
onoremap <Space><Space>T T<C-k>
vnoremap <Space><Space>f f<C-k>
vnoremap <Space><Space>t t<C-k>
vnoremap <Space><Space>F F<C-k>
vnoremap <Space><Space>T T<C-k>


" keep region selecting after indent

vnoremap < <gv
vnoremap > >gv


let $BASH_ENV = '~/.bash_aliases'


if has('win32')
    set clipboard+=autoselect
endif


" Line/Column Highlight Setting

autocmd BufEnter,WinEnter * setlocal cursorline
autocmd BufLeave,WinLeave * setlocal nocursorline
autocmd BufLeave,WinLeave * setlocal nocursorcolumn


imap <expr><C-v>  pumvisible() ? "\<C-n>\<C-n>\<C-n>\<C-n>" : "\<C-v>"
imap <expr><C-[>v pumvisible() ? "\<C-p>\<C-p>\<C-p>\<C-p>" : "\<C-[>v"

nnoremap <C-[>h <C-w>h
nnoremap <C-[>j <C-w>j
nnoremap <C-[>k <C-w>k
nnoremap <C-[>l <C-w>l
nnoremap <C-[>c <C-w>c
nnoremap <C-[>r <C-w>r

nnoremap Q   4
nnoremap QQ  8
nnoremap QQQ 16
onoremap Q   4
onoremap QQ  8
onoremap QQQ 16
xnoremap Q   4
xnoremap QQ  8
xnoremap QQQ 16

nnoremap <C-n> :<C-u>bn<CR>
nnoremap <C-p> :<C-u>bN<CR>

nnoremap ]q :<C-u>cn<CR>
nnoremap [q :<C-u>cN<CR>

cnoremap <C-[>b <S-Left>
cnoremap <C-[>f <S-Right>

nnoremap <C-s>s :<C-u>terminal ++rows=20<CR>
nnoremap <C-s>v :<C-u>vertical terminal<CR>

set showmode
set lazyredraw

set splitbelow
set splitright
set autoread

set diffopt=internal,filler,algorithm:histogram,indent-heuristic

" manage IME states
" https://www.regentechlog.com/2022/06/30/control-ime-by-vim/#%E8%A7%A3%E6%B1%BA%E7%AD%96
if exists('$TMUX')
    " when start insert mode
    let &t_SI.="Ptmux;[<r\\"
    " when leave from insert mode
    let &t_EI.="Ptmux;[<s[<0t\\"
    " when quit Vim
    let &t_te.="Ptmux;[<0t[<s\\"
else
    let &t_SI.="[<r"
    let &t_EI.="[<s[<0t"
    let &t_te.="[<0t[<s"
end

" Load Color Config
source $HOME/.rcfiles/.vimrc.colorscheme
