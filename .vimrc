set shell=/bin/bash
set nocompatible

set title
set number
set ruler
set wrap

set ignorecase
set smartcase
set expandtab   
set shiftwidth=4
set autoindent  
set smartindent 
set cindent      
set tabstop=4
set ignorecase
set smartcase
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" !PLUGINS
" Autocomplete plugin
Plugin 'Valloric/YouCompleteMe'
" Automatic closing of brackets, quotes etc.
Plugin 'Raimondi/delimitMate'
" Javascript utilities, syntax highlighting etc.
Plugin 'pangloss/vim-javascript'
" Ability to change surroundings of a word, e.g. parentheses or quotes
Plugin 'tpope/vim-surround'
" Syntax error checker
Plugin 'vim-syntastic/syntastic'
" Commenting utilities
Plugin 'scrooloose/nerdcommenter'
" For moving whole lines upwards and downwards
Plugin 'matze/vim-move' 
" For in-line editing in dynamically created file JS code inlined into HTML
" files
Plugin 'AndrewRadev/inline_edit.vim'
" Javascript code indexing stuff
Plugin 'ternjs/tern_for_vim'
" Nagivations
Plugin 'easymotion/vim-easymotion'
" C/C++ code indexing
Plugin 'vim-scripts/ctags.vim'
" Easy path finder / file opener
Plugin 'ctrlpvim/ctrlp.vim'
" Right hand side bar
Plugin 'majutsushi/tagbar'
" C++ coge navigation
"Plugin 'lyuts/vim-rtags'
" NerdTree
Plugin 'scrooloose/nerdtree'
" C++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" vim airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" COLORS
syntax enable
set t_Co=256
" set background=dark
" colorscheme solarized 
" colorscheme chroma
color molokai
" colorscheme lyla
" colorscheme mustang
" colorscheme wombat
" colorscheme custom
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


" execute pathogen#infect()
" call pathogen#helptags()

filetype plugin indent on
syntax on

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"Exiting Vim if NerdTree is the last buffer
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" set foldmethod=syntax
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1



" Key Mappings
imap jk <Esc>



" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

" NERD COMMENTER
let mapleader=","
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



" vim-move
let g:move_key_modifier = 'C'


" vim-easymotion
" <Leader>f{char} to move to {char}
 map  <Leader>f <Plug>(easymotion-bd-f)
 nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
 map <Leader>L <Plug>(easymotion-bd-jk)
 nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
 map  <Leader>w <Plug>(easymotion-bd-w)
 nmap <Leader>w <Plug>(easymotion-overwin-w)

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Tagbar
nmap <F8> :TagbarToggle<CR>

" Switch header/source 
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" Rtags
let g:rtagsUseLocationList = 0


"Clang complete
let g:clang_library_path='/home/seb/clang/clang+llvm-3.9.1-x86_64-linux-gnu-debian8/lib/'
let g:clang_auto_select=1
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets_engine="clang_complete"
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_exec="clang"
let g:clang_user_options=""
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
let g:clic_filename="/home/seb/Desktop/inventory_manager/unix/devl/project-index/index.db"
"Smart window movement
" map <C-j> <C-W>j
" map <C-h> <C-W>h
" map <C-k> <C-W>k
" map <C-l> <C-W>l
"
" CSCOPE
source ~/cscope_maps.vim

" CTAGS
nnoremap <leader>. :CtrlPTag<cr>
" C++ highlighting options
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:airline#extensions#tabline#enabled = 1
