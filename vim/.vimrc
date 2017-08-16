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
nnoremap <space> za     " space open/closes folds
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
let maplocalleader = ","
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

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'
" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'
" visualize your Vim undo tree
Plug 'sjl/gundo.vim'
" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree', { 'on' :  'NERDTreeToggle' }
" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" A modern vim plugin for editing LaTeX files
Plug 'lervag/vimtex', { 'for' : 'tex' }
" Check your python source files with PEP8
Plug 'vim-scripts/pep8', { 'for' : 'python' }
" Much better OCaml indentation, and more...
"Plug 'vim-scripts/omlet.vim'
" numbers.vim is a vim plugin for better line numbers
Plug 'myusuf3/numbers.vim'
" Next generation completion framework
Plug 'Shougo/neocomplete.vim'
" snippet support to Vim
Plug 'Shougo/neosnippet.vim'
" The standard snippets repository for neosnippet
Plug 'Shougo/neosnippet-snippets'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'
" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'
" Alternate screen setup for terminal Vim
Plug 'fcpg/vim-altscreen'
" Adds file type glyphs/icons
Plug 'ryanoasis/vim-devicons'
" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'
" OCP-indent for vim
Plug 'let-def/ocp-indent-vim', { 'for' : 'ocaml' }

call plug#end()
" }}}

" AIRLINE {{{
" always draw status bar
set laststatus=2
" force use of powerline patched fonts
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
" }}}

" GUNDO {{{
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
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
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
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
        set conceallevel=2 concealcursor=nc
endif
" }}}

" TAGBAR.VIM {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" VIMTEX {{{
let g:vimtex_echo_ignore_wait = 1
let g:vimtex_disable_version_warning = 1
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_manual = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
endif
" enable completion for latex with vimtex
let g:neocomplete#sources#omni#input_patterns.tex =
                        \ '\v\\%('
                        \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
                        \ . '|hyperref\s*\[[^]]*'
                        \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|%(include%(only)?|input)\s*\{[^}]*'
                        \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                        \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|usepackage%(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
                        \ . '|\a*'
                        \ . ')'
" }}}

" OCP-INDENT {{{
set rtp+=~/.vim/plugged/ocp-indent-vim
"}}}

" MERLIN {{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
endif
" enable completion for ocaml with merlin
let g:neocomplete#sources#omni#input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
" }}}

" COLOR {{{
set t_Co=256		    " Use 256 colours (Use this setting only if your terminal support 256 colours)
colorscheme gruvbox     " set vim colorscheme
syntax enable           " enable syntax processing
set background=dark		" set dark theme
" }}}

"{{{ HACK
" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %
"}}}

" FOLDING VIMRC {{{
set modelines=1
" vim:foldmethod=marker:foldlevel=0
