" dein.vim {{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Prepare .vim dir
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
  if ! isdirectory(s:vimdir)
    call system("mkdir " . s:vimdir)
  endif
endif

" Set dein paths
let s:dein_dir = s:vimdir
let s:dein_github = s:dein_dir . '/repos/github.com'
let s:dein_repo_name = "Shougo/dein.vim"
let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

" Check dein has been installed or not.
if !isdirectory(s:dein_repo_dir)
  echo "dein is not installed, install now "
  let s:dein_repo = "https://github.com/" . s:dein_repo_name
  echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
  call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
endif

let &runtimepath = &runtimepath . "," . s:dein_repo_dir

" Begin plugin part
"call dein#begin(expand('~/.vim/dein'))
call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"call dein#add('Shougo/unite.vim', {
"      \ 'depends': ['vimproc'],
"      \ 'on_cmd': ['Unite'],
"      \ 'lazy': 1})
"if has('lua')
"  call dein#add('Shougo/neocomplete.vim', {
"        \ 'on_i': 1,
"        \ 'lazy': 1})
"  call dein#add('ujihisa/neco-look', {
"        \ 'depends': ['neocomplete.vim']})
"endif
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('junegunn/vim-easy-align')
call dein#add('glidenote/memolist.vim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/neocomplete.vim')
call dein#add('marcus/rsense')
call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-endwise')
call dein#add('elzr/vim-json')
call dein#add('altercation/vim-colors-solarized')

call dein#add('tomasr/molokai')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('scrooloose/nerdtree')
call dein#add('t9md/vim-quickhl')
call dein#add('tpope/vim-surround')
" markdown
call dein#add('plasticboy/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')

call dein#end()

" Installation check.
if dein#check_install()
  call dein#install()
endif

"}}}
" --------------------------------------------
" Plugins {{{
" Molokai Color Scheme {{{

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
set t_Co=256
"}}}
" Indent Guides  {{{
"_ " vim-indent-guides
"_ " Vim 起動時 vim-indent-guides を自動起動
"_ let g:indent_guides_enable_on_vim_startup=1
"_ " ガイドをスタートするインデントの量
"_ let g:indent_guides_start_level=2
"_ " 自動カラー無効
"_ let g:indent_guides_auto_colors=0
"_ " 奇数番目のインデントの色
"_ autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
"_ " 偶数番目のインデントの色
"_ autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
"_ " ガイドの幅
"_ let g:indent_guides_guide_size = 1
"}}}
" NERDTree {{{
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"}}}
" Vim-quickhi {{{
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"}}}
" Memolist settings "{{{
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"

let g:memolist_filename_prefix_none = 1
let g:memolist_qfixgrep = 1
let g:memolist_ex_cmd = 'NERDTree'
"
"}}}
" Rsense {{{
let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec'
let g:rsenseUseOmniFunc = 1
" }}}
" PrevimOpen {{{
noremap <silent> <F7> :PrevimOpen<CR>
" }}}
 
"}}}
" --------------------------------------------
" Base settings {{{
" vim内部で使われる文字コードを設定する
set encoding=utf-8
" ファイル書き込み時の文字コードを設定する
set fileencoding=utf-8
" ファイル読み込み時の文字コードを指定する
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
" 想定される改行コードを指定する
set fileformats=unix,dos,mac


" ハイライトを有効化する
syntax enable

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on
"}}}
" --------------------------------------------
" Search Settings {{{
" 検索時に大文字小文字を無視 (ignorecase:無視する noignorecase:無視しない)
set noignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別 (smartcase:有効 nosmartcase:無効)
set smartcase
" 検索をインクリメンタルに行う
set incsearch
" 検索パターンのマッチ箇所の強調表示
set hlsearch
"}}}
" --------------------------------------------
" Edit settings {{{
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
set clipboard=unnamed,autoselect

" 折りたたみ手動
set fdm=manual

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"行頭の余白内でTabを打ち込むと、'shiftwidth'の数だけインデントする
set smarttab
"モードライン
set modeline
"Ctrl+aで8進数の計算をさせない
set nrformats-=octal
"タブ・スペース表示
"set lcs=tab:>.,trail:_,extends:\
"挿入モード終了時にIME状態を保存しない
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"inoremap <silent> <C-[> <ESC>:set iminsert=0<CR>
"IMEモード固定
"inoremap <silent> <C-j> <C-^>
"カーソルを行頭、行末で止まらないようにする。
set whichwrap=b,s,h,l,<,>,[,],~
set ambiwidth=double
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$

" }}}
" --------------------------------------------
" Visual Settings {{{
" 行番号を表示 (number:有効 nonumber:無効)                                   s
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
"set foldmethod=manual
set foldmethod=marker

" 全角スペースに色付け
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

" for get status
function! GetStatusEx()
  let str = ''
  let str = str . '[' . &fileformat . ']'
  if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fenc . ']' . str
  endif
  return str
endfunction
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
" }}}
" --------------------------------------------
" Vimdiff settings {{{
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
" }}}
" --------------------------------------------
" BackupFile Settings {{{

" バックアップファイルの生成先変更
set backupdir=/var/tmp
" swapファイルの生成先変更
set directory=/var/tmp
" .unファイルの生成先変更
set noundofile
" }}}
" --------------------------------------------
" .vimrcを<space><dot>で開く {{{
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
" }}}
" --------------------------------------------
" Json formatter at python {{{
 command! JsonFormat :execute '%!python -m json.tool'
" command! JsonFormat :execute '%!python -m json.tool'
"  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
"  \ | :%s/ \+$//ge
"  \ | :set ft=javascript
"  \ | :1
"set virtualedit+=all
" }}}
" --------------------------------------------
" easy-align Settings {{{
vnoremap <silent><Enter> :EasyAlign<cr>
" }}}
" --------------------------------------------
" --------------------------------
" neocomplete.vim
" --------------------------------
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" " syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" " active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_ruby_checkers = ['rubocop']

" -------------------------------
" jq
" -------------------------------
" if executable('jq')
"   function! s:jq(has_bang, ...) abort range
"     execute 'silent' a:firstline ',' a:lastline '!jq' string(a:0 == 0 ? '.' : a:1)
"     if !v:shell_error || a:has_bang
"       return
"     endif
"     let error_lines = filter(getline('1', '$'), 'v:val =~# "^parse error: "')
"     " 範囲指定している場合のために，行番号を置き換える
"     let error_lines = map(error_lines, 'substitute(v:val, "line \\zs\\(\\d\\+\\)\\ze,", "\\=(submatch(1) + a:firstline - 1)", "")')
"     let winheight = len(error_lines) > 10 ? 10 : len(error_lines)
"     " カレントバッファがエラーメッセージになっているので，元に戻す
"     undo
"     " カレントバッファの下に新たにウィンドウを作り，エラーメッセージを表示するバッファを作成する
"     execute 'botright' winheight 'new'
"     setlocal nobuflisted bufhidden=unload buftype=nofile
"     call setline(1, error_lines)
"     " エラーメッセージ用バッファのundo履歴を削除(エラーメッセージをundoで消去しないため)
"     let save_undolevels = &l:undolevels
"     setlocal undolevels=-1
"     execute "normal! a \<BS>\<Esc>"
"     setlocal nomodified
"     let &l:undolevels = save_undolevels
"     " エラーメッセージ用バッファは読み取り専用にしておく
"     setlocal readonly
"   endfunction
"   command! -bar -bang -range=% -nargs=? Jq  <line1>,<line2>call s:jq(<bang>0, <f-args>)
" endif
