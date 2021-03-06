imap kj <Esc>
set pastetoggle=<f9>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Smart auto-indentation for Python
Plugin 'vim-scripts/indentpython.vim'

" Linters
Plugin 'dense-analysis/ale'

" Awesome staring screen for Vim
Plugin 'mhinz/vim-startify'

" File manager
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Search bar
Plugin 'kien/ctrlp.vim'

" git diffs
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

" For integration with tmux
Plugin 'jpalardy/vim-slime'

" Autopep8
Plugin 'tell-k/vim-autopep8'

" Syntax
Plugin 'sheerun/vim-polyglot'

" Status bar (powerline)
Plugin 'itchyny/lightline.vim'

" Fuzzy searcher
Plugin 'junegunn/fzf.vim'

" Autocompletion for python
Plugin 'davidhalter/jedi-vim'

" Python automatic docstring
Plugin 'heavenshell/vim-pydocstring'

call vundle#end()            " required
filetype plugin indent on    " required

" execute pathogen#infect()
syntax on


set noswapfile

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> characte

" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth
set colorcolumn=110
set tw=120


" F6 for opening NERDTree
nmap <F6> :NERDTreeToggle<CR>
" Automatic NERDTree
" autocmd vimenter * NERDTree
" Close NERDTree if no tabs left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fix TMUX colors
set background=dark
set t_Co=256

" vim-slime configuration
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}

" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 

:set hlsearch

" Setting autosave on
let g:auto_save = 1 

" Git features
let g:NERDTreeShowIgnoredStatus = 1

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab,yaml  let b:comment_leader = '# '
autocmd FileType tex,matlab       let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" YcmCompleter
nnoremap <leader>ji :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToInclude<CR>
nnoremap <leader>jf :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinition<CR>

let g:ycm_confirm_extra_conf = 0
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_add_preview_to_completeopt = 1

" Closing braces
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <F4> :! catkin config -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON; catkin build mpcurv <CR>
nnoremap <F5> :! roslaunch fssim_interface mpcurv_simulation.launch <CR>

au FileType cpp set softtabstop=4 | set shiftwidth=4
au FileType python set softtabstop=4 | set shiftwidth=4

" Themes
" syntax enable
syntax enable

" set background=dark
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:vimtex_view_method = 'zathura'
let g:slime_python_ipython = 1


" Leetcode keymappings
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" set leetcode
let g:leetcode_browser='firefox'

" Ale configs
let g:ale_linters = {'python': ['mypy', 'flake8']}
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1

" Lightbar 
set laststatus=2
set noshowmode

" Fugitive
set splitbelow

" Needed for fzf
set rtp+=/home/vjose/.fzf

" Automatic python doctrings
let g:pydocstring_formatter = 'google'
