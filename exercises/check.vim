func! CheckAnswer()
  let result = trim(system(substitute(getline('.'), '^\s*\$\s*', '', '')))
  let expected = trim(join(getline(line('.')+1, search('^\$\|^```\|##### add your solution here', 'n')-1), "\n"))
  if result ==# expected
    echohl Keyword
    echo 'Correct!'
  else
    echohl WarningMsg
    echo "Not quite. Expected:\n" . expected . "\nActual:\n" . result
  endif
  echohl None
endfunc

com! CheckAnswer :call CheckAnswer()

nnoremap <C-m> :CheckAnswer<CR>
