set expandtab
set softtabstop=4
set ts=8
set sw=1
"set tags=/remote/swefs/PE/products/icc2/m2016.12_sp_dev//clientstore/icc2_m2016.12_sp_dev/nwtn/src/tags
set tags=/remote/swefs/PE/products/dgplt/main/clientstore/dgplt_main/clt/cltsh_nogui/tags,./tags,/remote/swefs/PE/products/dgplt/r_dev/clientstore/dgplt_r_dev_build2/nwtn/src/tags,/remote/swefs/PE/products/spf/r2020.09_sp_dev/clientstore/spf_r2020.09_sp_dev/syn/icc_sh/tags 


map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"
 
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
" set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4 " tab width is 4 spaces
set shiftwidth=2 " indent also with 4 spaces
set expandtab " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
set number  " turn line numbers on
set showmatch " highlight matching braces
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

set lines=50  " vim window height  
set columns=120 "vim window width
set cursorline  "highlight current line
highlight CursorLine guibg=#000050 guifg=fg
set showcmd  " show command in bottom bar
set incsearch   " find all matches character while searching instead of just current one
set hlsearch    " highlight matches
" \+space will just end highligh, not command
nmap <leader><space> :nohlsearch<CR>
set smartcase  
set ignorecase "combine with smartcase will perform like this: if search text contains capotal char will auto case-sensitive
set laststatus=2
set ttyfast "scroll fast
set undodir=~/.vim/undodir
set undofile
set nowrap "onece char number exceed a number it will auto wrap, use this to disable
set backspace=indent,eol,start "enable backspace to work
set background=dark
call plug#begin('~/.vim/plugged')

"color scheme
Plug 'morhetz/gruvbox' 
"very fast grep - currently just not working
"Plug 'jremmen/vim-ripgrep'
"conduct git operations in vim
"Plug 'tpope/vim-fugitive'
"script nicely colored, indent better
Plug 'leafgarland/typescript-vim'
"fantastic man page
Plug 'vim-utils/vim-man'
"great for c++
Plug 'lyuts/vim-rtags'
"nice file finding, current just not working, it works with rig grep
"Plug 'https://github.com/kien/ctrlp.vim.git'
"Auto complete
"It's just not working currently, as cmake version is too low, need ./install.py --ts-completer  in .vim/plugged/YouCompleteMe
"Plug 'https://github.com/ycm-core/YouCompleteMe.git' 
"undo tree
Plug 'mbbill/undotree' 

call plug#end()


colorscheme gruvbox

"let rg can always detect your root
if executable('rg')
  let g:rg_derive_root='true'
endif


"basic thing to help to ignore the things you don't wsnt to search for
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"press to enter to your command
let mapleader = " "
"For file tree, tell how to open files with browse split 2
let g:netrw_browse_split=2
let g:netrw_banner=0 
let g:netrw_winsize=25
"let g:ctrlp_use_caching=0

"non command - space + h will navigate to left window
nnoremap <leader>h :wincmd h<CR>
"non command - space + l will navigate to left window
nnoremap <leader>l :wincmd l<CR>
"non command - space + u will split a undo tree view in the left
nnoremap <leader>u :UndotreeShow<CR>
"non command - space + pv will split a vertical winodw in the right
"command ex will go to current file's parent folder
nnoremap <leader>pv :wincmd v<CR> :Ex <bar> :vertical resize 30<CR>

nnoremap <leader>ps :Rg<SPACE>


nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>




" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
imap <F2> <C-X><C-I>
imap <F3> <C-X><C-O>
imap <F4> <C-p>
"nmap <Tab> :tabn <CR>
 
" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"
 
" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :!synmake<CR>
" build using makeprg with <S-F7>
map <S-F7> :!synmake clean<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
” diff settings
map <M-Down> ]c
map <M-Up> [c
map <M-Left> do
map <M-Right> dp
map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
" spell settings
":setlocal spell spelllang=en
" set the spellfile - folders must exist
"set spellfile=~/.vim/spellfile.add
map <M-Down> ]s
map <M-Up> [s
endif

"source ~/.vim/taglist.vim 
"nmap <F8> :TlistToggle<CR>

"source /remote/pcgopt04/SH_RD/vim_plug_j/omnicppcomplete/omnicpp.gvimrc
