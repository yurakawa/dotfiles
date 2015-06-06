"---------------------------------------------------------------------------
" neobundle settings
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

" " Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'OmniSharp/omnisharp-vim'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'Townk/vim-autoclose'

" NeoBundle 'thinca/vim-ref'
" NeoBundle 'tpope/vim-endwise'
" NeoBundle 'vim-scripts/ruby-matchit'
" NeoBundle 'scrooloose/syntastic'                              j

" vim color scheme
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'vim-scripts/Wombat'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'vim-scripts/rdark'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ---------------------------------------------------------------------------
" color settings
colorscheme darkblue

" ---------------------------------------------------------------------------
filetype plugin indent on
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
set matchtime=1

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

set display=lastline
" 補完表示数
set pumheight=10

"折りたたみ有効化
set foldmethod=marker


"---------------------------------------------------------------------------
" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

" bin:~/bin/git-diff-normal-format
let g:git_diff_normal="git-diff-normal"
let g:git_diff_normal_opts=["--diff-algorithm=histogram"]
function! GitDiffNormal()
  let args=[g:git_diff_normal]
  if &diffopt =~ "iwhite"
    call add(args, "--ignore-all-space")
  endif
  call extend(args, g:git_diff_normal_opts)
  call extend(args, [v:fname_in, v:fname_new])
  let cmd="!" . join(args, " ") . ">" . v:fname_out
  silent execute cmd
  redraw!
endfunction
if executable(g:git_diff_normal)
  call system(g:git_diff_normal)
  if v:shell_error == 0
    set diffexpr=GitDiffNormal()
  endif
endif

"---------------------------------------------------------------------------
" ファイル操作に関する設定:

" バックアップファイルの生成先変更
set backupdir=/var/tmp
" swapファイルの生成先変更
set directory=/var/tmp

" .unファイルの生成先変更
set noundofile

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

nnoremap Y y$

" ---------------------------------------------------------------------------
" .vimを<space><dot>
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
"
" ---------------------------------------------------------------------------

map <F2> :v/\d\d:\d0/d<kEnter>:sort<kEnter>:%s/Mbps//g<kEnter>gg8w
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
" for get status
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

" ---------------------------------------------------------------:-----------
" for quickrun"{{{

let g:quickrun_config = get(g:, 'quickrun_config', {})
" vimproc を使って非同期に実行し，結果を quickfix に出力する
let g:quickrun_config._ = {
            \ 'outputter' : 'quickfix',
            \ 'runner' : 'vimproc'
            \ }
let g:quickrun_config.cpp = {
            \ 'command' : 'clang++',
            \ 'cmdopt' : '-std=c++1y -Wall -Wextra',
            \ }
""}}}
"  " ---------------------------------------------------------------------------
" for Neocomplete"{{{
" NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
" 
" if neobundle#is_installed('neocomplete')
"   " for neocomplete
" 
"   " Disable AutoComplPop.
"   let g:acp_enableAtStartup = 0
"   " Use neocomplete.
"   let g:neocomplete#enable_at_startup = 1
"   " Use smartcase.
"   let g:neocomplete#enable_smart_case = 1
"   " Set minimum syntax keyword length.
"   let g:neocomplete#sources#syntax#min_keyword_length = 3
"   let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 
"   " Define dictionary.
"   let g:neocomplete#sources#dictionary#dictionaries = {
"         \ 'default' : '',
"         \ 'vimshell' : $HOME.'/.vimshell_hist',
"         \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }
" 
"   " Define keyword.
"   if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
"   endif
"   let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" 
"   " Plugin key-mappings.
"   inoremap <expr><C-g>     neocomplete#undo_completion()
"   inoremap <expr><C-l>     neocomplete#complete_common_string()
" 
"   " Recommended key-mappings.
"   " <CR>: close popup and save indent.
"   inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"   function! s:my_cr_function()
"     return neocomplete#close_popup() . "\<CR>"
"     " For no inserting <CR> key.
"     "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"   endfunction
"   " <TAB>: completion.
"   inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"   " <C-h>, <BS>: close popup and delete backword char.
"   inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"   inoremap <expr><C-y>  neocomplete#close_popup()
"   inoremap <expr><C-e>  neocomplete#cancel_popup()
" 
"   " Enable omni completion.
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 
"   " Enable heavy omni completion.
"   if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
"   endif
" 
"   let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"   let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" 
"   if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
"   endif
"   let g:neocomplete#force_overwrite_completefunc = 1
"   let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"   let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" 
" 
"   " for  C and C++
"   let g:clang_complete_auto=0
"   let g:clang_auto_select=0
"   let g:clang_use_library=1
"   let g:clang_debug=1
"   if has('mac')
"     let g:clang_library_path="/usr/lib"
"   endif
"   let g:clang_user_options = '-std=c++11 -stdlib=libc++'
" 
" elseif neobundle#is_installed('neocomplcache')
"   " neocomplcache用設定
"   let g:neocomplcache_enable_at_startup = 1
"   let g:neocomplcache_enable_ignore_case = 1
"   let g:neocomplcache_enable_smart_case = 1
"   if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
"   endif
"   let g:neocomplcache_keyword_patterns._ = '\h\w*'
"   let g:neocomplcache_enable_camel_case_completion = 1
"   let g:neocomplcache_enable_underbar_completion = 1
" endif
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>""}}}
" ---------------------------------------------------------------------------
" for memolist"{{{
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
" let g:memolist_memo_date = "epoch"
" let g:memolist_memo_date = "%D %T"
" let g:memolist_prompt_tags = 1
" let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
" let g:memolist_vimfiler = 1
" let g:memolist_template_dir_path = "path/to/dir""}}}
" ---------------------------------------------------------------------------
"for easy-align
vnoremap <silent><Enter> :EasyAlign<cr>
" ---------------------------------------------------------------------------
