packadd minpac

call minpac#init()

call minpac#add('morhetz/gruvbox') " colors
call minpac#add('prettier/vim-prettier') " prettify JS
call minpac#add('dense-analysis/ale') " linting
call minpac#add('scrooloose/nerdtree') " file explorer
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('tpope/vim-fugitive') " git
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('alok/notational-fzf-vim')
call minpac#add('vimwiki/vimwiki')

" Keymaps
let mapleader = ' '
nnoremap <SPACE> <Nop>

inoremap jk <ESC>

" vimrc edits
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>

" open nerdtree
nmap <leader>f :NERDTreeToggle<Enter>  
" open NT on file
nnoremap <silent> <Leader>ff :NERDTreeFind<CR>

" fzf
nmap <leader>h <plug>(fzf-maps-n)
xmap <leader>h <plug>(fzf-maps-x)
nmap <C-p> :Files<cr>

" nv fzf
nnoremap <silent> <leader>nf :NV<CR>

" Settings

filetype plugin on
syntax on
set nocompatible
set number
set noshowmode
set autoread "reload files changed outside vim

set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

set backspace=indent,eol,start

set termguicolors

set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Plugin Settings
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" nerdtree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Theme
let g:gruvbox_contrast_dark="hard"
set background=dark
colorscheme gruvbox

" prettier
let g:prettier#autoformat = 1
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'

" nv_fzf
let g:nv_search_paths = ['~/Dropbox/notes','~/Dropbox/zettl']

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/notes', 'syntax': 'markdown', 'ext': '.md'},{'path': '~/Dropbox/zettl', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" autogroups
" you keep this in a group so you can reload vimrc on save without bloating autocmds
augroup vimrc
   autocmd!
   " when you save a file in discourse run Prettier so you do not forget
   autocmd BufWritePre *discourse/*.js,*discourse/*.es6,*discourse/*.scss,*discourse/*.css PrettierAsync
   " auto close tab if last window remaining in nerdtree
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
   autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
