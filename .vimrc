scriptencoding utf-8
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-characterize'
Plugin 'nono/jquery.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/syntastic'
Plugin 'walm/jshint.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'lilydjwg/colorizer'

" Colorschemes
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
"Plugin 'vim-scripts/taglist.vim'

call vundle#end()

let g:Powerline_symbols = 'fancy'
let g:lightline = {
	\   'colorscheme': 'wombat',
	\   'component': {
	\   'readonly': '%{&readonly?"":""}',
	\   },
	\   'separator': { 'left': '', 'right': '' },
	\   'subseparator': { 'left': '', 'right': '' }
	\ }
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = "/usr/bin/python2.7"

" Indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" Convert Sass/SCSS to CSS on write
:autocmd BufWritePost *.scss execute ":silent !sass " . expand('%') .  " " . expand('%:r') . ".css"
" HTML syntax highlighting in JS
:autocmd FileType javascript :JsPreTmpl html

" Mappings
" Sessions
map <F2> :mksession! ~/.vimsess <CR>
map <F3> :source ~/.vimsess <CR>
" Substitute word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" Substitute visual selection
vnoremap <Leader>s "sy:%s/\<<C-r>s\>//g<Left><Left>
" Split navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

function InsertEmptyLine()
	let a:cursor = getpos(".")
	exec "normal o\<Esc>"
	call setpos(".", a:cursor)
endfunction
nnoremap <silent> <CR> :call InsertEmptyLine()<CR>

" For the lightline.vim plugin
set laststatus=2
set noshowmode

" Syntastic recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0

" Syntastic checkers
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_checkers = ['php', 'phplint']

" Other settings
filetype plugin indent on
syntax on
set foldmethod=indent
set hidden
set number
set ignorecase
set smartcase
set incsearch
set cursorline
set wildignore+=lib,generated

" Colorscheme
let g:gruvbox_italic = 1
set background=dark
:colorscheme gruvbox
