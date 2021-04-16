let b:did_indent = 1

setlocal nolisp
setlocal autoindent

setlocal indentexpr=GetPythonIndent(v:lnum)
setlocal indentkeys+==elif,=except

" Keep in order of frequency
let b:python_blocks = ['if', 'for', 'elif', 'else', 'def', 'while', 'with', 'try', 'except', 'class']
let b:block_regex = '^\s*\(' . join(b:python_blocks, '\|') . '\)'

let b:spaces_only = '^\s\+$'
let b:opening_delims = '[[{(:]'
let b:closing_delims = '[]})]'

" multiline dicts, lists, sets, tuples definition
let b:multiline_item_regex = '^\s*[a-zA-Z_][0-9a-zA-Z_]* = ' . b:opening_delims . '$'

function GetPythonIndent(lnum)
    let l:prevline = getline(a:lnum - 1)

    if l:prevline[-1:] =~ b:opening_delims
        if getline(a:lnum) =~ '^\s*' . b:closing_delims . '$'
            return indent(a:lnum - 1)
        else
            return indent(a:lnum - 1) + shiftwidth()
        endif
    endif

    if empty(l:prevline) || l:prevline =~ b:spaces_only
        let l:pprevline = getline(a:lnum - 2)
        if empty(l:pprevline)
            return indent(a:lnum - 3)
        else 
            return indent(a:lnum - 2)
        endif
    endif

    # default
    return indent(a:lnum - 1)

endfunction
