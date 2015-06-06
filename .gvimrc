" ---------------------------------------------------------------------------
" カラー設定:
colorscheme solarized
" ---------------------------------------------------------------------------
" フォント設定:
if has('win32') || has('win64')
  set guifont=MS_Gothic:h9:cSHIFTJIS
elseif has('mac')
  set guifont=Andale\ Mono:h14
  set guifontwide=ヒラギノ角ゴ\ StdN\ W8:h14

elseif has('xfontset')
  set guifontset=a14,r14,k14
endif
" ---------------------------------------------------------------------------
" ウインドウに関する設定:

" ウインドウの幅
set columns=96
" ウインドウの高さ
set lines=80
" コマンドラインの高さ(GUI使用時)
" ウインドウの透明さ
set transparency=3
" ---------------------------------------------------------------------------
" ツールバー非表示
set guioptions-=T
" メニューバー非表示
" set guioptions-=m

set guioptions=none
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
set guioptions+=a
" windowsのクリップボードと同期
set clipboard=unnamed
" ビープ音、画面フラッシュを無効
set vb t_vb=
" ---------------------------------------------------------------------------
" 日本語入力ON時のカーソルの色を設定

if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=Purple guifg=NONE
endif

" ---------------------------------------------------------------------------
" タブ切り替え
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

" ---------------------------------------------------------------------------
"挿入モードから抜ける/入る際にIMEがオフにする。for Kaoriya版
set imdisable
