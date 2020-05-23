if &compatible
    set nocompatible
endif
"" Add dein installation dir into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif
""
filetype plugin indent on
syntax enable

colorscheme iceberg
set history=50
set ruler
set showcmd
set incsearch
set number
set cursorline
set cursorcolumn
set expandtab
set tabstop=4
set shiftwidth=4
set noshowmode

map Q gq
inoremap <C-u> <C-G>u<C-U>

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEX
        au!
        " In text files, always limit the width of text to 78 characters
        autocmd FileType text setlocal textwidth=78
        " When editing a file, always jump to the last cursor position
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
    augroup END

else
    set autoindent

endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
