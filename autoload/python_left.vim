let s:pmarks = {}

function! s:get_indent()
  return len(matchstr(getline('.'), '^[ ^I]*'))
endfunction

function! python_left#left()
  if (getline(".") == "")
    echo "Empty line"
    return
  endif
  let prevpos = getpos(".")
  let pnum = s:get_indent() - 1
  if (pnum < 0)
    echo "On top level already"
  else
    let p_regex = '^\( \)\{0,' . pnum . '\}[^ ]'
    call search('' . p_regex,'bsWe')
    let s:pmarks[join(getpos("."), ",")] = prevpos
  endif
endfunction

function! python_left#next()
 let p_regex = '^\( \)\{0,' . s:get_indent() . '\}[^ ]'
 call search('' . p_regex,'We')
endfunction

function! python_left#prev()
 let p_regex = '^\( \)\{0,' . s:get_indent() . '\}[^ ]'
 call search('' . p_regex,'bWe')
endfunction

function! python_left#right()
  let prevpos = getpos(".")
  let pnum = s:get_indent()
  let prevpos[2] = pnum + 1
  try
    call setpos(".", s:pmarks[join(prevpos,",")])
  catch /.*/
    if (pnum == 0)
      return
    endif

    let p_regex = '^\( \)\{0,' . (pnum - 1) . '\}[^ ]'
    call search('' . p_regex,'cbsWe')
    try
      call setpos(".", s:pmarks[join(getpos("."),",")])
    catch /.*/
      call setpos(".", prevpos)
      echo "No saved position"
    endtry
  endtry
endfunction
