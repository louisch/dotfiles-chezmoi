" Plugin configuration

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
" As vim-buffet provides the tabline, disable lightline's tabline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \ }
  \ }

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

"" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

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

"" vim-buffet
let g:buffet_always_show_tabline = 1
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=2  ctermfg=8 guibg=#d33682 guifg=#073642
  hi! BuffetActiveBuffer  cterm=NONE ctermbg=10 ctermfg=2 guibg=#2aa198 guifg=#073642
  hi! BuffetBuffer        cterm=NONE ctermbg=10 ctermfg=8 guibg=#073642 guifg=#93a1a1
  hi! BuffetTrunc         cterm=bold ctermbg=11 ctermfg=8 guibg=#dc322f guifg=#073642
  hi! BuffetTab           cterm=NONE ctermbg=4  ctermfg=8 guibg=#268bd2 guifg=#073642
  hi! link BuffetModCurrentBuffer BuffetCurrentBuffer
  hi! link BuffetModActiveBuffer  BuffetActiveBuffer
  hi! link BuffetModBuffer        BuffetBuffer
  hi! link BuffetLeftTrunc        BuffetTrunc
  hi! link BuffetRightTrunc       BuffetTrunc
  hi! link BuffetEnd              BuffetBuffer
endfunction

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

"" vim-diminactive
let g:diminactive_enable_focus = 1

"" vim-signify
let g:signify_vcs_list = ['git']
highlight SignColumn ctermbg=234 cterm=NONE guibg=NONE gui=NONE
highlight SignifySignAdd cterm=bold ctermbg=234 ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=234 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=234 ctermfg=227

"" YouCompleteMe
nnoremap <leader>yf :YcmCompleter FixIt<CR>
let g:ycm_key_detailed_diagnostics = '<leader>yd'
