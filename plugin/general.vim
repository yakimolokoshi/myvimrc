" エディタ表示設定
set number
set list
set listchars=tab:>-,trail:-,nbsp:%
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" 折り返し無効
set nowrap

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" ステータス行に現在のgitブランチを表示する
set laststatus=2
set statusline=%F%m%r%h%w%=\ %{fugitive#statusline()}\[%l/%L,%04v]
"
" 検索結果をハイライト表示する
set hlsearch

" 関数名表示
nnoremap <C-f> :Tlist<CR>

" 暗い背景色に合わせた配色にする
set background=dark

" 構文毎に文字色を変化させる
syntax on

" カラースキーマの指定
colorscheme desert

" filetypeに合わせたプラグインを使用する
" filetypeに合わせたindentを使用する
filetype plugin indent on

" フォルダ設定
nnoremap <S-f> z
set foldmethod=syntax
set foldlevelstart=20

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" visual選択範囲を検索
vnoremap * "zy:let @/ = @z<CR>n"

" 検索時にヒット数を表示
nnoremap <expr> / _s(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _s(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
       \ if line("'\"") > 0 && line ("'\"") <= line("$") |
       \   exe "normal! g'\"" |
       \ endif
endif

" バイナリエディタ設定
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" diffアルゴリズム変更
if &diff
  let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

packadd termdebug
