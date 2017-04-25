scriptencoding utf-8
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-characterize'
Plugin 'wincent/command-t'
Plugin 'christoomey/vim-tmux-navigator'

" Syntax
Plugin 'kovetskiy/sxhkd-vim'
Plugin 'lilydjwg/colorizer'
Plugin 'walm/jshint.vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'nono/jquery.vim'
Plugin 'Quramy/vim-js-pretty-template'

" Colorschemes
Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'jansenfuller/crayon'
Plugin 'vim-scripts/taglist.vim'

call vundle#end()

" Lightline
let g:Powerline_symbols = 'fancy'
let g:lightline = {
	\   'colorscheme': 'wombat',
	\   'component': {
	\   'readonly': '%{&readonly?"":""}',
	\   },
	\   'separator': { 'left': '', 'right': '' },
	\   'subseparator': { 'left': '', 'right': '' }
\ }


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter = "/usr/bin/python2.7"
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Eclim
let g:EclimCompletionMethod = "omnifunc"

" Indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" Convert Sass/SCSS to CSS on write
:autocmd BufWritePost *.scss execute ":silent !sass " . expand('%') .  " " . expand('%:r') . ".css"
" HTML syntax highlighting in JS
:autocmd FileType javascript :JsPreTmpl html

" ============================================ Mappings
" Sessions
map <F2> :mksession! ~/.vimsess
map <F3> :source ~/.vimsess <CR>

" Substitute word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" Substitute visual selection
vnoremap <Leader>s "sy:%s/\<<C-r>s\>//g<Left><Left>

" Indent all and return to position
function IndentAll()
	let a:cursor = getpos(".")
	exec "normal gg=\<Esc>"
	call setpos(".", a:cursor)
endfunction
nnoremap g= gg=G''

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
let g:syntastic_cpp_checkers = ['clang_check']

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
set showcmd
set scrolloff=5

" Colorscheme
let g:gruvbox_italic = 1
set background=dark
set t_ut=

augroup Color
	autocmd!
	autocmd ColorScheme * hi CursorLine ctermbg=10 ctermfg=NONE cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
	autocmd ColorScheme * hi ErrorMsg   ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#383E47 gui=NONE
	"autocmd ColorScheme * hi MatchParen ctermbg=3 ctermfg=10 cterm=NONE guibg=#D8C27A guifg=#282C33 gui=NONE
augroup END

colorscheme crayon
