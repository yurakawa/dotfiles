"---------------------------------------------------------------------------
" vi互換モードをOFF
set nocompatible
"---------------------------------------------------------------------------
"" plugin - NeoBundle(mac)
 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))
"
" " Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet.git'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'tpope/vim-endwise'
"NeoBundle 'vim-scripts/ruby-matchit'
"NeoBundle 'scrooloose/syntastic'
" vim color scheme
"NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'jpo/vim-railscasts-theme'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'vim-scripts/Wombat'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'vim-scripts/rdark'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'git://github.com/Shougo/vimproc.git'
" NeoBundle 'git://github.com/Shougo/unite.vim.git'

" ---------------------------------------------------------------------------
filetype plugin indent on    " required!
filetype indent on
syntax enable

"---------------------------------------------------------------------------
" 検索に関する設定:
"
" 検索時に大文字小文字を無視 (ignorecase:無視する noignorecase:無視しない)
set noignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別 (smartcase:有効 nosmartcase:無効)
set smartcase
" 検索をインクリメンタルに行う
set incsearch
" 検索パターンのマッチ箇所の強調表示
set hlsearch

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=2
" インデントの各段階に使われる空白の数。
set shiftwidth=2
" <Tab>の挿入や<BS>の使用等の編集操作をする時に、<Tab>が対応する空白の数。
set softtabstop=0
" タブをスペースに展開 (expandtab:有効 noexpandtab:無効)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (wrapscan:有効 nowrapscan:無効)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
"モードライン
"set modeline
"Ctrl+aで8進数の計算をさせない
"set nrformats-=octal
"タブ・スペース表示
"set lcs=tab:>.,trail:_,extends:\
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を表示 (number:有効 nonumber:無効)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" 長い行を折り返して表示 (wrap:有効 nowrap:無効)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
"set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 現在のモードの表示
set showmode

"---------------------------------------------------------------------------
" ファイル操作に関する設定:

" バックアップファイルを作成しない
set nobackup
set noswapfile

"---------------------------------------------------------------------------
"文字コードの設定
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
set fileformats=unix,dos,mac
"---------------------------------------------------------------------------
set clipboard=unnamed,autoselect
"---------------------------------------------------------------------------
"挿入モード終了時にIME状態を保存しない
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"inoremap <silent> <C-[> <ESC>:set iminsert=0<CR>

"IMEモード固定
"inoremap <silent> <C-j> <C-^>

" Alt+o 現在位置を保持して下に行追加
noremap <A-o> m`o<ESC>``

" ---------------------------------------------------------------------------
"カーソルを行頭、行末で止まらないようにする。
set whichwrap=b,s,h,l,<,>,[,],~
set ambiwidth=double
nnoremap n nzz
nnoremap N Nzz

" ---------------------------------------------------------------------------
" .vimを<space><dot>
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
"
" ---------------------------------------------------------------------------

set virtualedit+=all
" ---------------------------------------------------------------------------

if has('syntax')
  syntax enable
  function! ActivateInvisibleIndicator()
    highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=#FF0000
    match ZenkakuSpace /　/
  endfunction
  augroup InvisibleIndicator
    autocmd!
    autocmd BufEnter * call ActivateInvisibleIndicator()
  augroup END
endif

" ---------------------------------------------------------------------------
" GetStatusEx
"
" ステータス表示用function
"
function! GetStatusEx()
  let str = ''
  let str = str . '[' . &fileformat . ']'
  if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fenc . ']' . str
  endif
  return str
endfunction
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>

" ---------------------------------------------------------------------------
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

elseif neobundle#is_installed('neocomplcache')
    " neocomplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
