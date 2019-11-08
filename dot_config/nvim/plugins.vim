" Plugin configuration

"" Devdocs
nmap K <Plug>(devdocs-under-cursor)

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

" Lightline
" As lightline includes mode information, do not show mode information in
" the last line
set noshowmode
set showtabline=2
let g:lightline = {}
let g:lightline.colorscheme = 'solarized'
let g:lightline.tabline = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline.component_function = {
\ 'filetype': 'MyFileType',
\ 'fileformat': 'MyFileFormat',
\ 'modified': 'MyModified'
\ }

function! MyFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileFormat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyModified()
  return &modified ? '✎' : &modifiable ? '' : '-'
endfunction

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"" NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>nv :NERDTreeVCS<CR>

"" NERDCommenter
" Auto delete buffer when file has been deleted
let g:NERDTreeAutoDeleteBuffer = 1
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

"" Ale
let g:ale_linters = { 'javascript': ['stylelint', 'eslint'] }
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier', 'eslint']
\}

"" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"" vim-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" vim-diminactive
let g:diminactive_enable_focus = 1

"" vim-gitgutter
highlight GitGutterAdd guifg=#859900 guibg=#073642 ctermfg=2 ctermbg=8
highlight GitGutterChange guifg=#b58900 guibg=#073642 ctermfg=3 ctermbg=8
highlight GitGutterDelete guifg=#dc322f guibg=#073642 ctermfg=1 ctermbg=8
highlight GitGutterChangeDelete guifg=#dc322f guibg=#073642 ctermfg=1 ctermbg=8
let g:gitgutter_sign_added = "+"
let g:gitgutter_sign_removed = "✂"
let g:gitgutter_sign_removed_first_line = "✄"
let g:gitgutter_sign_modified = "✎"
let g:gitgutter_sign_modified_removed = "✎×"
let g:gitgutter_grep = 'ack'

"" YouCompleteMe
nnoremap <leader>yf :YcmCompleter FixIt<CR>
let g:ycm_key_detailed_diagnostics = '<leader>yd'
