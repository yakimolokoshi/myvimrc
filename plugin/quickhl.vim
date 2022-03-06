" ハイライト設定
nmap <Space>h <Plug>(quickhl-manual-this)
xmap <Space>h <Plug>(quickhl-manual-this)
nmap <Space>H <Plug>(quickhl-manual-reset)
xmap <Space>H <Plug>(quickhl-manual-reset)
nmap <Space><C-h> <Plug>(quickhl-manual-this-whole-word)
xmap <Space><C-h> <Plug>(quickhl-manual-this-whole-word)

let g:quickhl_manual_colors = [
   \ "cterm=bold ctermfg=7   ctermbg=1   guibg=#70a040 guifg=#ffffff",
   \ "cterm=bold ctermfg=7   ctermbg=4   guibg=#20b2aa guifg=#ffffff",
   \ "cterm=bold ctermfg=7   ctermbg=5   guibg=#6a5acd guifg=#ffffff",
   \ "cterm=bold ctermfg=7   ctermbg=6   guibg=#f08080 guifg=#ffffff",
   \ "cterm=bold ctermfg=7   ctermbg=2   guibg=#ffa500 guifg=#ffffff",
   \ "cterm=bold ctermfg=7   ctermbg=3   guibg=#cd4040 guifg=#ffffff",
   \ "cterm=bold ctermfg=5   ctermbg=7   guibg=#cd4040 guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=2   guibg=#ffa500 guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=1   guibg=#70a040 guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=3   guibg=#cd4040 guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=4   guibg=#20b2aa guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=5   guibg=#6a5acd guifg=#ffffff",
   \ "cterm=reverse,bold ctermfg=7   ctermbg=6   guibg=#f08080 guifg=#ffffff",
   \ ]

command! -nargs=1 Hl QuickhlManualAdd! <args>
command! -nargs=1 Hd QuickhlManualDelete! <args>

command! Dff Hl ^+[^+]\+<CR>
command! Dfd Hl ^-.\+<CR>

