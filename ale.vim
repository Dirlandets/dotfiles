" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': ['flake8', 'mypy']}
" Disable warnings about trailing whitespace for Python files.<C-w>e
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_emit_conflict_warnings = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_disable_lsp = 1
let g:ale_echo_msg_error_str = 'L'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1

let g:ale_sign_warning = '='
let g:ale_sign_error = '*'
nmap <silent> <C-E> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
" if v:version < 700 || exists('loaded_bclose') || &cp
"  finish
" endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

