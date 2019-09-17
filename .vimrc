imap kj <Esc>
set pastetoggle=<f9>

" call plug#begin('~/.vim/plugged')
"     Plug 'taketwo/vim-ros'
" call plug#end()

execute pathogen#infect()

filetype plugin indent on
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
set tw=80


" F6 for opening NERDTree
nmap <F6> :NERDTreeToggle<CR>
" Automatic NERDTree
autocmd vimenter * NERDTree
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

nnoremap <leader>ji :YcmCompleter GoTo<CR>
nnoremap <leader>jd :YcmCompleter GoToInclude<CR>
nnoremap <leader>jf :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoToDefinition<CR>

let g:ycm_confirm_extra_conf = 0

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <F4> :! catkin config -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON; catkin build mpcurv <CR>
nnoremap <F5> :! roslaunch fssim_interface mpcurv_simulation.launch <CR>

au FileType cpp set softtabstop=2 | set shiftwidth=2
au FileType python set softtabstop=4 | set shiftwidth=4

" Themes
" syntax enable
colorscheme gruvbox 
syntax enable
set background=dark

set runtimepath^=~/.vim/bundle/ctrlp.vim

