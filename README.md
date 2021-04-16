# fast-python-indent

An indent file for vim.

The indent files included with vim, and the other ones that I have tried,
are very slow. When `profile`ing, they are consistently marked as the slowest
functions.

Here's the result of a `profile` of running `1000o<esc>` at the end of a large Python
file with default indenting, and then with `fast-python-indent`:


```vim
" Built-in indent file
FUNCTIONS SORTED ON TOTAL TIME
count  total (s)   self (s)  function
 1000   9.867825   9.862754  GetPythonIndent()
" ...

" fast-python-indent
FUNCTIONS SORTED ON TOTAL TIME
count  total (s)   self (s)  function
    1   0.023404   0.000086  <SNR>108_VimCloseCallback()
    1   0.023303   0.000057  <SNR>108_VimExitCallback()
    1   0.023204   0.000164  <SNR>103_ExitCallback()
    1   0.022936   0.000099  <SNR>102_HandleExit()
 1000   0.022573             GetPythonIndent()
" ...
```

`fast-python-indent` is over 437x faster! 

This file will correctly indent the vast majority of lines, but it is not
guaranteed to be PEP8 compliant.
