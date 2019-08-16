" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jonathanfilip/vim-lucius'
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jszakmeister/vim-togglecursor'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tcomment_vim'
call plug#end()

scriptencoding utf-8
syntax on
set background=dark
let mapleader = ","
set hlsearch
set display+=lastline
set incsearch
set laststatus=2
set magic
set ignorecase
set smartcase
set showcmd
set title
set acd
set autoread
set tabstop=4 shiftwidth=4 expandtab
set backspace=2
set smarttab
set autoindent
set smartindent
set wrap
set noerrorbells visualbell t_vb= 
set encoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251
set number
set ruler
set hidden
set noautochdir
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git,*.pyc
set conceallevel=2
set modelines=1
set foldtext=getline(v:foldstart)

"""""""""""""""""" STUFF """"""""""""""""""""""""""""
" List toggle | leader+l
nnoremap <silent> <Leader>l :set list!<CR>
" Buffer list | leader+b 
nmap <Leader>b :Buffers<CR>
" Open files in splits | leader+f, leader+v 
nnoremap <silent> <Leader>f :call fzf#run({
\   'down': '40%',
\   'sink': 'e' })<CR>
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

" Toogle cursor
let g:togglecursor_default = "block"
let g:togglecursor_insert = "line"
let g:togglecursor_leave = "block"

" indentLine
" Make indent line faster
let g:indentLine_faster=1
" IndentLine character For use this feature please install patched font from repository root
let g:indentLine_char=nr2char(0xE0B4)
let g:indentLine_char = '|'
" vim-devicons 
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args='--max-line-length=120'
let g:syntastic_python_flake8_args='--ignore=D400'
" Syntax check mode for javascript (npm install jslint)
" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
let g:syntastic_always_populate_loc_list = 1
" nerdtree | leader+e, leader+E
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$']
" vim-airline
let g:airline_powerline_fonts = 1 " Use airline fonts
let g:airline_theme='minimalist'
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=0
let g:airline_enable_bufferline=0
let g:airline_section_c = ''
" nerd tree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

nnoremap <silent> <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <Leader>E :NERDTreeFind<CR>
"  Insert pdb set trace (requires python3)
function! Pdb()
python3 << endPython
new_cword = "import pdb;pdb.set_trace()"
vim.command("normal o%s" % new_cword)
 
endPython
endfunction
nnoremap <silent> <Leader>pdb :call Pdb()
nnoremap gf gF
" Search word under cursor by using Ag | leader + a
colors lucius " Color scheme
hi FoldColumn ctermbg=NONE guibg=NONE
" Sign colors
hi! link SignColumn FoldColumn
" Disable background and foreground for vertical split
hi vertsplit ctermbg=NONE guibg=NONE
hi! link Folded ColorColumn
hi! link Error SpellBad
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" jedi-vim
let g:jedi#use_tabs_not_buffers = 1 | set switchbuf=newtab,usetab
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#documentation_command = "K"
let g:jedi#auto_close_doc = 0

" proceed undofiles
set undofile
set undodir=$HOME/.vim/vimundo
" Store undofile in to fixed location
if exists("+undofile")
     " undofile - This allows you to use undos after exiting and restarting
     " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
     " :help undo-persistence
     " This is only present in 7.3+
     set undofile
     " Store undo files in to fixed location
     set undodir=/var/tmp//,/tmp//,.
endif

 " Store swap files in to fixed location
set noswapfile
set directory=/var/tmp//,/tmp//,.
" Store backup files in to fixed location
set nobackup
set backupdir=/var/tmp//,/tmp//,.
set path=.,,**

" Hide preview window
set completeopt=menuone,longest
set confirm
set viminfo='10,\"100,:20,%,n~/.viminfo
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

