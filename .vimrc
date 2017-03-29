" tabline color
" 代码折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" disable mouse
set mouse-=a
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" neo vim python provider
let g:python_host_prog  = '/usr/local/var/pyenv/shims/python'
let g:python3_host_prog = '/usr/local/var/pyenv/shims/python'

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Remain in terminal
" set t_ti= t_te=

" fzf
set rtp+=~/.fzf

"vim-ctrlspace
set nocompatible
set hidden

" backspace
set backspace=indent,eol,start " backspace over everything in insert mode
set autoindent

" faster
"set ttyfast
set lazyredraw

" files syntax
syntax on
filetype plugin on
" filetype plugin indent on
set autoread
" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
"autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
autocmd FileType yaml set sw=2 sts=2 et
autocmd FileType puppet set sw=2 sts=2 et

if v:version >= 703
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 nocursorline nocursorcolumn
else
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2
endif

set hlsearch
set showmode

" tab width
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" aieline
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" F1 - F6 设置
" F1 废弃这个键,防止调出系统帮助
" F2 行号开关，用于鼠标复制代码用
" F3 粘贴模式paste_mode开关,用于有格式的代码粘贴
" F4 换行开关
" F5 打开终端
" F6 显示可打印字符开关
" F7 语法开关，关闭语法可以加快大文件的展示

" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
" noremap <F1> <Esc>"
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

""为方便复制，用<F2>开启/关闭行号显示:
"function! HideNumber()
"  if(&relativenumber == &number)
"    set relativenumber! number!
"  elseif(&number)
"    set number!
"  else
"    set relativenumber!
"  endif
"  set number?
"endfunc
function! HideNumber()
    if(&number)
        set number?
    endif
    set number!
endfunc
nnoremap <F2> :call HideNumber()<CR>
set pastetoggle=<F3>            "    when in insert mode, press <F3> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F5> :terminal<CR>
nnoremap <F6> :set list! list?<CR>
nnoremap <F7> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
"""

" set relativenumber number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
set number

" tab 操作
" TODO: ctrl + n 变成切换tab的方法
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
"map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" TODO: 配置成功这里, 切换更方便, 两个键
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" buffer access
nnoremap <leader>l :ls<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>b1 :1b<CR>
nnoremap <leader>b2 :2b<CR>
nnoremap <leader>b3 :3b<CR>
nnoremap <leader>b4 :4b<CR>
nnoremap <leader>b5 :5b<CR>
nnoremap <leader>b6 :6b<CR>
nnoremap <leader>b7 :7b<CR>
nnoremap <leader>b8 :8b<CR>
nnoremap <leader>b9 :9b<CR>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" ------- 选中及操作改键

"Reselect visual block after indent/outdent.调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

inoremap kj <Esc>

"Map ; to : and save a million keystrokes
"" ex mode commands made easy 用于快速进入命令行
nnoremap ; :
" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 定义函数AutoSetFileHead，自动插入文件头
" autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" 突出显示当前行等
set cursorcolumn
set cursorline          " 突出显示当前行


" set colorcolumn
function! ColorColumn()
    if(&colorcolumn == 80)
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunc
nnoremap <Leader>b :call ColorColumn()<cr>

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

hi TabLine      ctermfg=Black  ctermbg=248      cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=243      cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=32       cterm=NONE
