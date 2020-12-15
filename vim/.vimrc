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
Plug 'brooth/far.vim'

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
" Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp

" vim-snippets
Plug 'honza/vim-snippets'

" lightline
Plug 'itchyny/lightline.vim'

" easymotion
Plug 'easymotion/vim-easymotion'

" multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" ale
" Plug 'dense-analysis/ale'

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
noremap <silent> <F2>  :noh<CR>
noremap <leader>fl  :r !figlet<SPACE>

" window move
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

nnoremap <C-Left> <C-W><
nnoremap <C-Down> <C-W>-
nnoremap <C-Up> <C-W>+
nnoremap <C-Right> <C-W>>


nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>


" autoformat
noremap <silent> <leader>fm  :Autoformat<CR>

" undotree
nnoremap <silent> <leader>ud :UndotreeToggle<CR>

" fugitive
nnoremap git :Git<SPACE>

" easymotion disturbs diagnostics
let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
    if EasyMotion#is_active()
        let g:easymotion#is_active = 1
        silent! CocDisable
    else
        if g:easymotion#is_active == 1
            let g:easymotion#is_active = 0
            silent! CocEnable
        endif
    endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()

" nvim
let g:ruby_host_prog = '/home/srillia/.gem/ruby/2.7.0/bin/neovim-ruby-host'

" ale
" let g:ale_linters = {
"     \ 'sh': ['language_server'],
"     \ }

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r /home/srillia/mine/vim/vimspector/config/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 /home/srillia/mine/vim/vimspector/config/',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>

" 调试c++ 需要先安装gdb,先编译 g++ foo.cpp -ggdb -o foo
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :VimspectorReset<CR>
nnoremap <leader>dw :VimspectorEval<SPACE>

"noremap <silent> <leader>dvs :call system('cp ~/.config/nvim/.vimspector.json .')<CR>
nmap <leader>dj :CocCommand java.debug.vimspector.start<CR>


" vim-maximizer
nnoremap <silent> <leader>mt :MaximizerToggle<CR>


" wildfire
" This selects the next closest text object.
" map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
" vmap <C-SPACE> <Plug>(wildfire-water)
" quick-select
" nmap <leader>ws <Plug>(wildfire-quick-select)

" md preview

nmap <silent> <leader>mp <Plug>MarkdownPreview
nmap <silent> <leader>mk <Plug>StopMarkdownPreview

" ack
cnoreabbrev Ack Ack!
nnoremap <Leader>ak :Ack! -i<Space>


" vista
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

let g:vista_default_executive = 'coc'

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
nnoremap   <silent>   <C-\>t   :FloatermToggle<CR>
tnoremap   <silent>   <C-\>t   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <C-\>o    :FloatermNew<CR>
tnoremap   <silent>   <C-\>o    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <C-\>p    :FloatermPrev<CR>
tnoremap   <silent>   <C-\>p    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <C-\>n    :FloatermNext<CR>
tnoremap   <silent>   <C-\>n    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <C-\>k    :FloatermKill!<CR>
tnoremap   <silent>   <C-\>k    <C-\><C-n>:FloatermKill!<CR>
tnoremap   <silent>   <C-\>b    <C-\><C-n>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""      coc.nvim       """"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-json',  'coc-git', 'coc-vimlsp', 'coc-tsserver',  'coc-go', 'coc-clangd', 'coc-snippets', 'coc-python', 'coc-vimlsp', 'coc-yaml', 'coc-todolist', 'coc-sql', 'coc-xml']

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

" nvim scroll
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>as  <Plug>(coc-codeaction-selected)
nmap <leader>as  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
nmap <silent><leader>cf :call CocAction('format')<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" nmap <silent><Leader>fd :call CocAction('fold')<CR>

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nmap <silent> <leader>ai   :call     CocAction('runCommand', 'editor.action.organizeImport')<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


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
