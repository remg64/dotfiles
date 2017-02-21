" SPACES & TABS {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" }}}

" COMPLETION IGNORE {{{
set wildignore=*.swp,*.bak,*.pyc,*.class,*~
" }}}

" UI CONFIG {{{
set number                          " show line numbers
set showcmd                         " show command in bottom bar
set cursorline                      " highlight current line
filetype indent on                  " load filetype-specific indent files
filetype plugin on		            " load filetype-specific plugin files
set wildmenu                        " visual autocomplete for command menu
"set lazyredraw                     " redraw only when we need to.
set showmatch                       " highlight matching [{()}]
set title				            " change terminal title
set noshowmode                      " doesn't show mode
set encoding=utf8                   " encoding is utf8
set guifont=MesloLGM\ Nerd\ Font    " set glyph font (NERDTREE, Airline, ...)
" }}}

" SEARCHING {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" }}}

" FOLDING {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" remove C-j behaviour
let g:C_Ctrl_j = 'off'
" movement in split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" LEADER SHORTCUTS {{{
let mapleader=","       " leader is comma
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sz :source ~/.zshrc<CR>
" set spelllang to french or english
nnoremap <leader>sf  :setlocal spell spelllang=fr<CR>
nnoremap <leader>se  :setlocal spell spelllang=en<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" map redo to U
nnoremap U <C-r><CR>
" save session
"nnoremap <leader>s :mksession<CR>
" }}}

" TMUX {{{
" allows cursor change in tmux mode
if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" PLUGIN {{{
" Automatic installation of vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on' :  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'alessandroyorba/despacio'
Plug 'lervag/vimtex', { 'for' : 'tex' }
Plug 'vim-scripts/pep8', { 'for' : 'python' }
Plug 'myusuf3/numbers.vim'
if has('nvim')
        Plug 'Shougo/deoplete.nvim'
else
        Plug 'Shougo/neocomplete.vim'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'majutsushi/tagbar'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'fcpg/vim-altscreen'
Plug 'ryanoasis/vim-devicons'
Plug 'josuegaleas/jay'

call plug#end()
" }}}

" AIRLINE {{{
" always draw status bar
set laststatus=2
" force use of powerline patched fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jay'
" }}}

" NERDTREE {{{
nmap <F2> :NERDTreeToggle<CR>
" }}}

" NUMBERS.VIM {{{
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
" }}}

" NEOCOMPLETE.VIM {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
endif
" }}}

" NEOSNIPPET.VIM {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
        set conceallevel=2 concealcursor=niv
endif
" }}}

" DEOPLETE.VIM {{{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}}

" TAGBAR.VIM {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" LATEX-BOX {{{
let s:extfname = expand("%:e")
if s:extfname ==? "tex"
        let g:LatexBox_split_type="new" " force horizontal split
        let g:LatexBox_fold_sections=[ "part", "chapter", "section", "subsection", "subsubsection", "paragraph", "subparagraph" ]
        " toggle TOC display
        nmap <F5> :LatexTOCToggle<CR>
endif
" }}}

" VIMTEX {{{
let g:vimtex_echo_ignore_wait = 1
" }}}

" FZF {{{
"nmap <F6> :FZF<CR>
" }}}

" COLOR {{{
set t_Co=256		    " Use 256 colours (Use this setting only if your terminal support 256 colours)
syntax enable           " enable syntax processing
set background=dark		" set dark theme
" }}}

" SYNTASTIC {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_c_remove_include_errors = 1
" }}}

" FOLDING VIMRC {{{
set modelines=1
" vim:foldmethod=marker:foldlevel=0
