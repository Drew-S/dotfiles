call plug#begin('~/.vim/plugged')
" Colors from PyWal
Plug 'dylanaraps/wal.vim'

"tab autocomplete already existing words
Plug 'ervandew/supertab'

"autocomplete pairs "" '' () {} []
Plug 'jiangmiao/auto-pairs'

"side bar file browse
Plug 'scrooloose/nerdtree'

"auto comment lines
Plug 'scrooloose/nerdcommenter'

"bottom bar information
Plug 'itchyny/lightline.vim'

"automatically create wrappings around object (html tags), (), {}
Plug 'tpope/vim-surround'

"syntax checking
Plug 'w0rp/ale'
"Plug 'vim-syntastic/syntastic'

"snippets engine
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "snippets

"used with lightline to house some git info
Plug 'tpope/vim-fugitive'

"colorize color codes #ff0000
Plug 'lilydjwg/colorizer'

"git info in the side
Plug 'airblade/vim-gitgutter'

"symbol browser (tags)
Plug 'majutsushi/tagbar'

"indentation guides
Plug 'yggdroot/indentline'

"nerdtree syntax highlightin (icons)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"simple X hotkey daemon highlighting
Plug 'kovetskiy/sxhkd-vim'

"automatic taggin ctags
Plug 'craigemery/vim-autotag'

"Smart html
Plug 'mattn/emmet-vim'

"Html in js template
Plug 'jonsmithers/vim-html-template-literals'

"Syntaxes
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'vim-python/python-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'isRuslan/vim-es6'
Plug 'JulesWang/css.vim'
Plug 'mboughaba/i3config.vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'soywod/typescript.vim'
Plug 'aklt/plantuml-syntax'
call plug#end()

syntax on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set wrap linebreak
set number
set laststatus=2 noshowmode
set t_Co=256
set mouse=a
set number relativenumber

autocmd BufRead,BufNewFile *.md set spell spelllang=en_ca

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

colorscheme wal

let g:indentLine_char = '▏'

map <C-b> :NERDTreeToggle<CR>
map <C-c> ,c<space>
hi Normal guibg=NONE ctermbg=NONE

let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active': {
      \    'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \  },
      \  'component_function': {
      \    'gitbranch': 'fugitive#head'
      \  },
      \  'separator': { 'left': "", 'right': "" },
      \  'subseparator': { 'left': "|", 'right': "|" }
      \}

let mapleader = ','

function HTMLEncode()
  :s/\%V&/\&amp;/ge
  :s/\%V</\&lt;/ge
  :s/\%V>/\&gt;/ge
endfunction

vmap <Leader>h :call HTMLEncode()<CR>

:autocmd BufWritePost ~/.conky/conkyrc.template :silent !$HOME/.conky/build.sh
