
au BufNewFile,BufRead *.json set filetype=json foldmethod=syntax
au BufNewFile,BufRead *.html.mu set filetype=html syntax=mustache 
au BufNewFile,BufRead *.html.hb set filetype=html syntax=mustache 
"au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.js.mu set filetype=javascript syntax=mustache 
au BufNewFile,BufRead *.js.hb set filetype=javascript syntax=mustache 
au BufNewFile,BufRead *.tjs set filetype=javascript
au BufNewFile,BufRead *.tjs.mu set filetype=javascript syntax=mustache 
au BufNewFile,BufRead *.tjs.hb set filetype=javascript syntax=mustache 
au BufNewFile,BufRead *.xml.hb set filetype=xml syntax=mustache 
au BufNewFile,BufRead *.swift.hb set filetype=swift 
au BufNewFile,BufRead *.swift.mu set filetype=swift
au BufNewFile,BufRead SConstruct set filetype=python
au BufNewFile,BufRead SConscript set filetype=python
au BufNewFile,BufRead *.cpp set syntax=cpp11

autocmd FileType terraform setlocal commentstring=#%s

" call SolarizedSetNormal()

autocmd BufEnter,FileType * 
\   if &ft ==# 'javascript' | call SolarizedSetNormal() | endif

" autocmd BufEnter,FileType * 
" \   if &ft ==# 'javascript' | call SolarizedBoldNormal() | endif

" autocmd BufEnter,FileType * 
" \   if &ft ==# 'javascript' || &ft ==# 'cpp' | colorscheme darkblue |
" \   elseif &ft ==? 'r' | colorscheme desert |
" \   else | colorscheme default |
" \   endif
