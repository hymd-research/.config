"" MyAutoCmd
augroup MyAutoCmd
	autocmd!
augroup END
"" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
" g:boolean
let g:false = 0
let g:true = 1

if &compatible
    set nocompatible
endif

if has('vim_starting')
	" Python 3
	if executable('/usr/bin/python3')
		let g:python3_host_prog = '/usr/bin/python3'
	elseif executable($PYENV_ROOT . '/shims/python3')
		let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
	else
		let g:python3_host_prog = '/usr/local/bin/python3'
	endif

	if &runtimepath !~# '/dein.vim'
		let s:dein_repo_dir = expand('$DATA/dein/repos/github.com/Shougo/dein.vim')

		" Auto Download
		if !isdirectory(s:dein_repo_dir)
			execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
		endif

		execute 'set runtimepath^=' . s:dein_repo_dir
	endif

	" Disable packpath
	set packpath=

	" Disable default plugins
	let g:loaded_gzip = 1
	let g:loaded_tar = 1
	let g:loaded_tarPlugin = 1
	let g:loaded_zip = 1
	let g:loaded_zipPlugin = 1
	let g:loaded_ruby_provider = 1
	let g:loaded_node_provider = 1
endif

"" Add dein installation dir into runtimepath
let s:dein = {'dir': expand('$DATA/dein'), 'config': expand('$CONFIG/nvim/dein')}
if dein#load_state(s:dein.dir)
	let s:dein.toml = {
				\ 'base': s:dein.config . '/base.toml',
				\ 'lazy': s:dein.config . '/lazy.toml',
				\ }

	call dein#begin(s:dein.dir, [expand('<sfile>'), s:dein.toml.base, s:dein.toml.lazy])

	call dein#load_toml(s:dein.toml.base, {'lazy': 0})
	call dein#load_toml(s:dein.toml.lazy, {'lazy': 1})

	call dein#end()
	call dein#save_state()

	if dein#check_install()
		" Installation check.
		call dein#install()
	endif
endif

syntax enable
syntax on

set cursorline
set cursorcolumn
set expandtab
set hlsearch
set history=50
set ruler
set incsearch
set noshowmode
set number
set showcmd
set smartindent
set shiftwidth=4
set splitright
set tabstop=4
set termguicolors

map Q gq
inoremap <C-u> <C-G>u<C-U>
"noremap <C-h> <C-w><C-h>
"noremap <C-j> <C-w><C-j>
"noremap <C-k> <C-w><C-k>
"noremap <C-l> <C-w><C-l>

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
    " relative row number.
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
    augroup END
else
    set autoindent
endif
