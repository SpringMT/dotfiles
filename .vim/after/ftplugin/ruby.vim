function! s:ExecuteMake()
  if &filetype == 'ruby' && expand('%:t') !~? '^pry\d\{8}.\+\.rb'
    silent make! -c "%" | redraw!
  endif
endfunction

compiler ruby
augroup rbsytaxcheck
  autocmd! BufWritePost <buffer> call s:ExecuteMake()
augroup END
