"Specify Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" vim-go
Plug 'fatih/vim-go', { 'tag': '*' }

" fugitive
Plug 'tpope/vim-fugitive'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-autoformat
Plug 'Chiel92/vim-autoformat'

"auto-pairs
Plug 'jiangmiao/auto-pairs'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" vim-floaterm
Plug 'voldikss/vim-floaterm'

" gruvbox
Plug 'morhetz/gruvbox'

" nerdcommenter
" Plug 'scrooloose/nerdcommenter'

" vim-commentary
Plug 'tpope/vim-commentary'

" undotree
Plug 'mbbill/undotree'

" fzf
Plug 'junegunn/fzf.vim'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" grep
" Plug 'dkprice/vim-easygrep'

" ack
Plug 'mileszs/ack.vim'

" vim spector
Plug 'puremourning/vimspector', { 'do': './install_gadget.py --enable-go'  }

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']  }

" Taglist
Plug 'liuchengxu/vista.vim'

" vim-maximizer
Plug 'szw/vim-maximizer'

" surround
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp

" vim-snippets
Plug 'honza/vim-snippets'

" lightline
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""        self-custom  """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let mapleader = "\"
set nocompatible
set number
set relativenumber
set showcmd
set hlsearch
set incsearch
set title
set wildmenu
set wildmode=longest:list,full
set wildignore=*.dll,*.exe,*.jpg,*.gif,*.png
set ignorecase
set updatetime=1
" set smartcase

"设置代码格式化规则
set cindent
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set expandtab       " expand tab to space


autocmd FileType json,sh setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set scrolloff=20
set pastetoggle=<F1>

" 鼠标指针样式 和终端有关
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" self custom shortcuts
noremap <silent> <leader>sv :source /home/srillia/.vimrc<CR>:noh<CR>
noremap <silent> <leader>sn :source /home/srillia/.config/nvim/init.vim<CR>:noh<CR>
noremap <silent> <leader>sw :w !sudo tee %<CR>
noremap <silent> <leader>y  "+y
noremap <silent> <leader>p  "+p
noremap <silent> <leader><leader>  :noh<CR>
noremap <leader>fl  :r !figlet<SPACE>

" autoformat
noremap <silent> <leader>fm  :Autoformat<CR>

" undotree
nnoremap <silent> <leader>ud :UndotreeToggle<CR>

" fugitive
nnoremap git :Git<SPACE>

" nvim
let g:ruby_host_prog = '/home/srillia/.gem/ruby/2.7.0/bin/neovim-ruby-host'


" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" 调试c++ 需要先安装gdb,先编译 g++ foo.cpp -ggdb -o foo
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :VimspectorReset<CR>

"noremap <silent> <leader>dvs :call system('cp ~/.config/nvim/.vimspector.json .')<CR>
nmap <leader>dj :CocCommand java.debug.vimspector.start<CR>


" vim-maximizer
nnoremap <silent> <leader>mt :MaximizerToggle<CR>


" wildfire
" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)
" quick-select
nmap <leader>ws <Plug>(wildfire-quick-select)

" md preview

nmap <silent> <leader>mp :MarkdownPreview<CR>

" ack
cnoreabbrev Ack Ack!
nnoremap <Leader>ak :Ack! -i<Space>


" vista
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

nnoremap <silent><leader>vt :Vista!!<CR>
nnoremap <silent><leader>vf :Vista finder!<CR>


" lightline
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'filename', 'modified', 'method' ] ]
"       \ },
"       \ 'component_function': {
"       \   'method': 'NearestMethodOrFunction'
"       \ },
"       \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""      grovbox    """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark    " 暗色系
" set background=light   " 亮色系
let g:airline_theme = 'airline'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""     airline    """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme='gruvbox'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""     easygrep   """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Grep_Default_Filelist = '*'
" nnoremap  <leader>g :Grep<SPACE>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""     nerdtree    """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启项目目录
map <silent> <leader>tt :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""        fzf      """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>ff :FZF<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""  nerdcommenter  """"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create default mappings
" let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""      floaterm       """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap   <silent>   <C-\>tt   :FloatermToggle<CR>
tnoremap   <silent>   <C-\>tt   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <C-\>to    :FloatermNew<CR>
tnoremap   <silent>   <C-\>to    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <C-\>tp    :FloatermPrev<CR>
tnoremap   <silent>   <C-\>tp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <C-\>tn    :FloatermNext<CR>
tnoremap   <silent>   <C-\>tn    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-\>tk    :FloatermKill!<CR>
tnoremap   <silent>   <C-\>tk    <C-\><C-n>:FloatermKill!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""      coc.nvim       """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = ['coc-json',  'coc-git', 'coc-vimlsp', 'coc-tsserver', 'coc-sh', 'coc-go', 'coc-clangd', 'coc-snippets', 'coc-python', 'coc-vimlsp', 'coc-yaml', 'coc-todolist', 'coc-sql', 'coc-xml']

" coc 配置 use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""   cscope  (use coc.nvim go to definition,deprecated)  """""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope auto add database   cscope -Rbq, ctags -R .
"function! LoadCscope()
"  let db = findfile("cscope.out", ".;")
"  if (!empty(db))
"    let path = strpart(db, 0, match(db, "/cscope.out$"))
"    set nocscopeverbose " suppress 'duplicate connection' error
"    exe "cs add " . db . " " . path
"    set cscopeverbose
"  " else add the database pointed to by environment variable 
"  elseif $CSCOPE_DB != "" 
"    cs add $CSCOPE_DB
"  endif
"endfunction
"au BufEnter /* call LoadCscope()
"
"map <silent> <F5> :!cscope -Rbq<CR>:cs reset<CR><CR>

" cscope 快捷键
"nmap <SPACE>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>f :cs find f <C-R>=expand("<cword>")<CR><CR>
"nmap <SPACE>i :cs find i <C-R>=expand("<cword>")<CR><CR>
