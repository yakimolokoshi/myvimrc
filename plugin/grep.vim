" grep設定
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
autocmd QuickfixCmdPost grep copen
nnoremap <expr> <Space>g ':sil grep! ' . expand('<cword>') . ' * --include=*.c --include=*.h --include=*.cpp --include=*.hpp -nw'
nnoremap <expr> <Space>f ':sil grep! ' . expand('<cword>') . ' * --include=*.h -nw'
nnoremap <expr> <Space>G ':sil grep! -nia ' . @" . " " . @%
nnoremap <expr> <Space><C-g> ':sil grep! ' . @" . ' * --include=*.c --include=*.h --include=*.cpp -nw'
"vnoremap <expr> <Space>G ':sil grep! ' . @z . ' *'

vnoremap <expr> <Space>g _()

function! s:get_v(str)
    let tmp = a:str
    silent normal gvy
    let selected = a:str
    let g:@@ = tmp
    return ':sil grep! ' . selected . ' * --include=*.c --include=*.h --include=*.cpp -nw'
endfunction

function! Func() range
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    echo selected
endfunction

function! _()
    command! -range Func :call Func()
    return s:get_v(Func())
endfunction

