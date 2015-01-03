"# jamoralesm@gmail.com - JA

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim.git'
Plugin 'sjl/gundo.vim.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'godlygeek/tabular.git'
Plugin 'StanAngeloff/php.vim.git'
Plugin 'othree/html5.vim.git'
Plugin 'joonty/vim-phpqa.git'
Plugin 'Lokaltog/vim-easymotion.git'
Plugin 'tpope/vim-surround.git'
Plugin 'nelstrom/vim-visual-star-search.git'
Plugin 'msanders/snipmate.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/loremipsum.git'
Plugin 'rstacruz/sparkup.git'
Plugin 'cakebaker/scss-syntax.vim.git'
Plugin 'tpope/vim-unimpaired.git'

" Colors
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
colorscheme jellybeans

" Leader Key is \ or , but can be set with
let mapleader=","

" Copy & Paste
set pastetoggle=<F2>
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set nonumber
set relativenumber
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=2
set autoindent
set textwidth=80
set ruler
set mouse=a
set fo-=t
set colorcolumn=81
set hidden
" set nowrap
set wrap
set showbreak=↪…
set linebreak
highlight ColorColumn ctermbg=239
set nobackup
set nowritebackup
set noswapfile

if has("autocmd")
    " Reload VIM configuration
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Show whitespace
    " MUST be inserted BEFORE the colorscheme command
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Enable filetype detection
    filetype plugin indent on

    " Restore cursor position
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif
if &t_Co > 2 || has("gui_running")
    " Enable syntax highlighting
    syntax on
endif

if has('gui_running')
    " set guifont=Consolas\ 11
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif


" Always sh
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=1
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
set laststatus=2
set noshowmode

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" set foldmethod=manual
command! -nargs=* Wrap set wrap linebreak nolist

if executable("par")
    set formatprg=par\ -w80jeq
endif

nmap <silent> <leader>s :set spell!<CR>
set spelllang=es

" --------------------------------------------------------------------
" Plugins
" --------------------------------------------------------------------

"https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

"https://github.com/kien/ctrlp.vim.git
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"http://github.com/sjl/gundo.vim.git
" let g:gundo_width = 60
" let g:gundo_preview_height = 40
" let g:gundo_right = 1
nnoremap <F4> :GundoToggle<CR>

"https://github.com/tomtom/tcomment_vim.git
map <Leader>c  <c-_><c-_>

"git://github.com/godlygeek/tabular.git
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a; :Tabularize /;<CR>
vmap <Leader>a; :Tabularize /;<CR>
nmap <Leader>a< :Tabularize /=><CR>
vmap <Leader>a< :Tabularize /=><CR>

"https://github.com/StanAngeloff/php.vim.git
let php_sql_query = 0
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1

"https://github.com/othree/html5.vim.git
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"https://github.com/joonty/vim-phpqa.git
" vmap <Leader>qa
" vmap <Leader>qc
" :Php - check for syntax errors
" :Phpcs - run code sniffer
" :Phpmd - run mess detector (will ask for a rule XML file if not set)
" :Phpcc - show code coverage (will ask for a clover XML file if not set)
"" let g:phpqa_messdetector_ruleset ="/home/jamoralesm/.vim/bundle/vim-phpqa/extra/phpmd/setup/src/main/xml/exts/phpmd.xml"
let g:phpqa_codesniffer_args = "--standard=PEAR"
" PHP executable (default = php)
"" let g:phpqa_php_cmd='/usr/bin/php'
" PHP Code Sniffer binary (default = phpcs)
"" let g:phpqa_codesniffer_cmd='/usr/bin/phpcs'
" PHP Mess Detector binary (default = phpmd)
"" let g:phpqa_messdetector_cmd='/usr/bin/phpmd'
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
" Show code coverage on load (default = 0)
" let g:phpqa_codecoverage_autorun = 1

"https://github.com/Lokaltog/vim-easymotion.git
" let g:EasyMotion_leader_key = '<Leader>'

"https://github.com/tpope/vim-surround.git
" Visual mode
" yssb or yss+something
" S for add a { surrounding }
" gS idem but text in a new line plus indent

"https://github.com/tpope/vim-unimpaired.git
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" --------------------------------------------------------------------
" KeyBinding
" --------------------------------------------------------------------

" map <tab> %
" map -- :let @a=&gfn<CR>:e ~/.gvimrc<CR>Go<Esc>"apV:s/ /\\ /g<CR>Iset guifont=
map -- :tabe $MYVIMRC<CR>

"  Back Buff
nmap <Leader>b <C-^>

" Mostrar Invisibles: tabs, EOL, etc.
nmap <Leader>l :set list!<CR>

" Quit: Ctrl+q
noremap <silent> <C-Q> :q<CR>
vnoremap <silent> <C-Q> <C-C>:q<CR>
inoremap <silent> <C-Q> <C-O>:q<CR>

" Save: Ctrl+s
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Fold:
nnoremap <Space> za
vnoremap <Space> za

" Move between split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Move between tabs
map <Leader>ñ <esc>:tabnext<CR>
map <Leader>m <esc>:tabprevious<CR>
" map <C-]> gt
" map <C-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" map sort
vnoremap <Leader>s :sort<CR>

" Better Selection
vnoremap < <gv
vnoremap > >gv

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Paste
nnoremap <ESC>P P'[v']=
nnoremap <ESC>p p'[v']=

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

map <leader>ec :tabe application/modules/

" --------------------------------------------------------------------
" Funciones vimcast.org
" --------------------------------------------------------------------

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" :args *.txt
" :vimgrep /Vimcasts\.\zscom/g ##
" :Qargs
" :argdo %s/Vimcasts\.\zscom/org/ge
" :argdo update
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <F5> :call Preserve("%s/\\s\\+$//e")<CR>
nmap <F6> :call Preserve("normal gg=G")<CR>
nmap <F7> :g/^$/d<<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" --------------------------------------------------------------------
" MIAS
" --------------------------------------------------------------------
nmap <Leader>d Yp
nmap <Leader>k ^di'O<ESC>pa AS <ESC>j^dt(di'k$pjdd
vmap <Leader>k "yyoecho '<pre> '; print_r()<ESC>"yPA; echo '</pre>';<ESC>F$ve"yy^f>"yp
nmap <Leader>' vi(S'
nmap <Leader>" vi(S"
nmap <Leader>w viwS'
vmap <Leader>f "tdiIF(<ESC>"tpa > 0, <ESC>"tpa, 0)<ESC>
vmap <Leader>i "ddiisset()<ESC>Pla ? <ESC>"dpa : 0<ESC>
vmap <Leader>I "tyOif (isset(<ESC>"tpa)) {<ESC>jo}<ESC>k>><ESC>
vmap <Leader>if "tyOif (<ESC>"tpa) {<ESC>jo}<ESC>k>><ESC>
vmap <Leader>n "ddiis_null()<ESC>Pla ? <ESC>"dpa : 0<ESC>
vmap <Leader>N "tyOif (!is_null(<ESC>"tpa)) {<ESC>jo}<ESC>k>><ESC>
vmap <Leader>ic "tdOif (<ESC>"tpa) {<ESC>jo} else {<CR>}<ESC>2k>><ESC>

