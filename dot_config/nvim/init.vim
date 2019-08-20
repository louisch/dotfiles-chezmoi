"" Local Machine settings
runtime local.vim

" Neovim Paths
if !exists(nvimdir)
    let nvimdir = "~/.config/nvim"
endif

" Specify a directory for plugins
" - For vim: '~/.vim/plugged'
" - For Neovim: '~/.local/share/nvim/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'bagrat/vim-buffet'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ycm-core/YouCompleteMe'

Plug 'itchyny/lightline.vim'
Plug 'ltlollo/diokai'
Plug 'altercation/vim-colors-solarized'

Plug 'gregsexton/MatchTag'
Plug 'sheerun/vim-polyglot'
call plug#end()


" Appearance
" set background=light
if has#colorscheme('diokai')
  color diokai
elseif has#colorscheme('desert')
  color desert
endif
" color solarized
if $TERM == "linux"
  set guicursor=
endif

" Lightline
" As lightline includes mode information, do not show mode information in
" the last line
set noshowmode
" As vim-buffet provides the tabline, disable lightline's tabline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \ }
  \ }


"" Line numbers
set number
set relativenumber

"" Highlight tabs, EOLs, trailing whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/


" Behaviour

" Filetype recognition
filetype on
filetype plugin indent on

"" Syntax highlighting
syntax enable

"" Show line and column number
set ruler

"" Highlight current line
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

"" Omnicompletion
set omnifunc=syntaxcomplete#Complete

"" Indentation
set expandtab
set tabstop=4
set shiftwidth=4

" Call the function after opening a buffer
autocmd BufReadPost * call has#TabsOrSpaces()

"" Windows
set splitright
set splitbelow

"" Search
set ignorecase
set smartcase

"" Folds
set nofoldenable

"" Disable swap
set noswapfile

"" Keybindings
let mapleader = ","
nnoremap <leader>vs :execute 'source' nvimdir . '/init.vim'<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>x :close<CR>
nnoremap ; :
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

"" Prompt to create directory if it does't exist
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

"" Source these files when saving them
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"" Filetype
autocmd FileType
      \ vim,
       \sh,
       \html,css,javascript,
       \scss,
       \typescript,
       \vue,
       \json,
       \php,
       \yaml
      \ setlocal shiftwidth=2 tabstop=2
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS

"" Minimum amount of lines syntax will look backwards to
autocmd BufEnter * :syntax sync minlines=200

"" incremental search/replace
set incsearch
set inccommand=nosplit
nnoremap zz :nohlsearch<CR>

" Persistent very magic
nnoremap / /\v
vnoremap / /\v
cnoremap sss s/\v


" Plugins

"" YouCompleteMe
nnoremap <leader>f :YcmCompleter FixIt<CR>

"" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

"" NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nv :NERDTreeVCS<CR>

"" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Gmove<CR>
nnoremap <leader>gg :Ggrep<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>

"" vim-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" vim-buffet
let g:buffet_always_show_tabline = 1
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
