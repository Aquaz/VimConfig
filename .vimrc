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


execute pathogen#infect()
call pathogen#helptags()

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
nmap s <Plug>(easymotion-overwin-f2)

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
