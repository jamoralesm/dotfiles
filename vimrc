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
" Plugin 'rayburgemeestre/phpfolding.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'joonty/vim-phpqa.git'

Plugin 'othree/html5.vim.git'
Plugin 'Lokaltog/vim-easymotion.git'
Plugin 'tpope/vim-surround.git'
Plugin 'nelstrom/vim-visual-star-search.git'
" Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/loremipsum.git'
Plugin 'rstacruz/sparkup.git'
Plugin 'cakebaker/scss-syntax.vim.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tommcdo/vim-exchange'
" Plugin 'msanders/snipmate.vim.git'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Colors
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'sudar/vim-arduino-syntax'

Plugin 'koron/nyancat-vim.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" Use the colorscheme from above
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
set t_Co=256

" colorscheme jellybeans
" let g:jellybeans_overrides = {
" \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
" \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
" \              'attr': 'bold' },
" \}

" Leader Key is \ or , but can be set with
let mapleader="ñ"
set encoding=utf-8
set fileencoding=utf-8
set omnifunc=syntaxcomplete#Complete
" Copy & Paste
set pastetoggle=<F2>
set clipboard=unnamed
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set number
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

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
"Opciones de impresión 
set printoptions=number:yes 
set printheader=%<%f%h%m%=Pag.:\ %N\ de\ %{line('$')/73+1} 
set cm=blowfish2

if has("autocmd")
    autocmd!
    " Reload VIM configuration
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Show whitespace
    " MUST be inserted BEFORE the colorscheme command
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    au InsertLeave * match ExtraWhitespace /\s\+$/

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    autocmd FileType php UltiSnipsAddFiletypes codeigniter

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Enable syntax highlighting
    syntax on
    " Enable filetype detection
    filetype plugin indent on

    " Restore cursor position
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

if has('gui_running')
    set guifont=Liberation\ Mono\ for\ Powerline
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

set foldmethod=manual
command! -nargs=* Wrap set wrap linebreak nolist

if executable("par")
    set formatprg=par\ -w80jeq
endif

nmap <silent> gs :set spell!<CR>
set spelllang=es

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" --------------------------------------------------------------------
" Plugins
" --------------------------------------------------------------------
let g:sparkupNextMapping="<c-ñ-e>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" if ! has('gui_running')
"     let g:airline_left_sep='|'
"     let g:airline_right_sep='|'
" endif

"https://github.com/kien/ctrlp.vim.git
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map ñp :CtrlPBuffer<CR>

"http://github.com/sjl/gundo.vim.git
" let g:gundo_width = 60
" let g:gundo_preview_height = 40
" let g:gundo_right = 1
nnoremap <F4> :GundoToggle<CR>

"git://github.com/godlygeek/tabular.git
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a- :Tabularize /-<CR>
nmap <Leader>a- :Tabularize /-<CR>
vmap <Leader>a; :Tabularize /;<CR>
vmap <Leader>a; :Tabularize /;<CR>
nmap <Leader>a< :Tabularize /=><CR>
vmap <Leader>a< :Tabularize /=><CR>

" https://github.com/rayburgemeestre/phpfolding.vim
" map <F9> <Esc>:EnableFastPHPFolds<CR>
" map <F10> <Esc>:EnablePHPFolds<CR>
" map <F11> <Esc>:DisablePHPFolds<CR> 
"https://github.com/StanAngeloff/php.vim.git
let php_sql_query = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 0

"https://github.com/othree/html5.vim.git
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"https://github.com/joonty/vim-phpqa.git
let g:phpqa_messdetector_ruleset ="unusedcode" ",~/.vim/phpdm.xml" ",codesize,naming,tional_relative_path_to_custom_ruleset.xml
let g:phpqa_codesniffer_args = "--standard=PSR2" "The installed coding standards are Zend, PSR2, Squiz, PEAR, MySource and PSR1
let g:phpqa_messdetector_autorun = 1
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_codecoverage_autorun = 0

"https://github.com/Lokaltog/vim-easymotion.git
let g:EasyMotion_leader_key = 'ñ'

"https://github.com/tpope/vim-unimpaired.git
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]
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
map <Leader>ñ <esc>:bn<CR>
map <Leader>m <esc>:bp<CR>

" map sort
vnoremap <Leader>s :sort<CR>

" Better Selection
vnoremap < <gv
vnoremap > >gv

nmap >> :><CR>
nmap << :<<CR>

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
map <leader>eq :e <C-R>=fnameescape(expand('%:h:h')).'/'<cr>

nmap <Leader>i :hardcopy > %:t.pdf<CR>

" -----------------------------------------------------------------------------
" RENAME CURRENT FILE (thanks Gary Bernhardt)
" -----------------------------------------------------------------------------
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>


" -----------------------------------------------------------------------------
" http://vim.wikia.com/wiki/VimTip431
" -----------------------------------------------------------------------------
function! ToggleSlash(independent) range
  let from = ''
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let first = matchstr(line, '[/\\]')
    if !empty(first)
      if a:independent || empty(from)
        let from = first
      endif
      let opposite = (from == '/' ? '\' : '/')
      call setline(lnum, substitute(line, from, opposite, 'g'))
    endif
  endfor
endfunction
command! -bang -range ToggleSlash <line1>,<line2>call ToggleSlash(<bang>1)
noremap <silent> <F8> :ToggleSlash<CR>

" -----------------------------------------------------------------------------
" Funciones vimcast.org
" -----------------------------------------------------------------------------

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

" nelstrom
function! FormatprgLocal(filter)
    if !empty(v:char)
        return 1
    else
        let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
        echo l:command
        execute l:command
    endif
endfunction
" if has("autocmd")
"     augroup ragtag_filetypes
"         autocmd!
"         autocmd FileType markdown call RagtagInit()
"     augroup END
"     let pandoc_pipeline = "pandoc --from=html --to=markdown"
"     let pandoc_pipeline .= " | pandoc --from=markdown --to=html"
"     autocmd FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
" endif


" --------------------------------------------------------------------
" MIAS
" --------------------------------------------------------------------
nmap <Leader>d @='Yp'<CR>
vmap <Leader>d ygv<ESC>pgv
nmap <Leader>W viwS'
nmap <Leader>bw :bw<CR>
