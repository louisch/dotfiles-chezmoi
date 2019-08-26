function! SetFTBasedOnContents()
  if getline(1) =~ '^#!.*[s]\?bin/sh\>' ||
   \ getline(1) =~ '^#!.*[s]\?bin/bash\>' ||
   \ getline(1) =~ '^#!.*\s\+\(ba\|c\|a\|da\|k\|pdk\|mk\|tc\)\?sh\>' ||
   \ getline(1) =~ '^#!.*\s\+zsh\>'
    set filetype=sh
  end
endfunction

autocmd BufRead,BufNewFile *.tmpl call SetFTBasedOnContents()
autocmd BufRead,BufNewFile *.vim.tmpl set filetype=vim
