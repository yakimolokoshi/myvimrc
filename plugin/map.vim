" Windowサイズ変更
nnoremap <S-l> <C-w>>
nnoremap <S-h> <C-W><
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-

" ヤンク結果をtagとして使う
nnoremap <Space>p :tag <C-r>"<CR>
"
" ヤンク結果をyレジスタに保存
noremap <Space>y :let @y = @"

" セッション保存
nnoremap <silent>z :mksession!<CR><C-w>
nnoremap <Space>r :source Session.vim<CR>

" ディレクトリのツリー表示
nnoremap <C-e> :NERDTree<CR>

" quickfix移動
nnoremap <Space>j :cn<CR>
nnoremap <Space>k :cp<CR>

"閉じ括弧を自動で挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" insertモードでのカーソル移動
inoremap <C-g>; <C-O>$;<CR>
inoremap <C-l> <RIGHT>
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>

" 隣接した{}で改行したらインデント
function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]    " 今いるカーソルの文字
    let beforeletter = getline(".")[col(".")-2] " 1つ前の文字

    " カーソルの位置の括弧が隣接している場合
    if nowletter == "}" && beforeletter == "{"
        return "\n\<C-o>\O"
    else
        return "\n"
    endif
endfunction
" {}の自動インデントをEnterに割り当て
inoremap <silent> <expr> <CR> IndentBraces()

" 自動インデント設定
function! IndentWithA()
    if len(getline('.')) == 0
        return "cc"
    else
        return "a"
    endif
endfunction

nnoremap <expr> a IndentWithA()

" 指定レジスタから貼り付け
for n in range(0, 9)
  " m0 でレジスタ0をp貼り付け
  execute 'nnoremap m'.n  '"'.n.'p'
  " M0 でレジスタ0をP貼り付け
  execute 'nnoremap M'.n  '"'.n.'P'

  " <C-m>0p で@0 = @"
  execute 'nnoremap <C-m>'.n.'p'  ':let @'.n.' = @"<CR>'
  " <C-m>p0 で@" = @0
  execute 'nnoremap <C-m>p'.n  ':let @" = @'.n.'<CR>'
  " <C-m>01 で@0 = @1
  for m in range(0, 9)
    execute 'nnoremap <C-m>'.n.m  ':let @'.n.' = @'.m.'<CR>'
  endfor
endfor

" Gtags設定
nnoremap <silent> gi :Gtags -f %<CR>
nnoremap <silent> gu :GtagsCursor<CR>
nnoremap <silent> gk :<C-u>exe('Gtags '.expand('<cword>'))<CR>
nnoremap <silent> gj :<C-u>exe('Gtags -r '.expand('<cword>'))<CR>
nnoremap <silent> ga :!(gtags -v --debug &> /dev/null)&<CR>
nnoremap <silent> gz :!(ctags -R &> /dev/null)&<CR>

