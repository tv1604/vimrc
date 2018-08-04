
let g:NERDTreeWinPos = "left"
let mapleader = "'"

map      <F2>      :NERDTreeFind<cr>
map      <F2><F2>  :NERDTreeToggle<cr>
nmap     <F3>      :bn<cr>
nnoremap <F5>      :DeleteHiddenBuffers<cr>
nnoremap <F8>      :TagbarToggle<cr>

map      <C-D> <C-W>v<cr>
nmap     <leader>e :Explore<cr>
nmap     <leader>t :terminal<cr>
nmap     <leader>l :ls<cr>
nmap     <leader>q :Bdelete<cr>
nmap     <leader>n :tn<cr>
nmap     <leader>c :ccl<cr>
noremap  <silent>  <C-S> :update<cr>
vnoremap <silent>  <C-S> <C-C>:update<cr>
inoremap <silent>  <C-S> <C-O>:update<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap ; :

set mouse=a
set confirm
set list
set listchars=tab:!·,trail:·
set number
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set tags=./tags;/

" Enable git gutter as default "
let g:gitgutter_enabled = 1

" Ctrlp Configuration "
let g:ctrlp_mruf_relative = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ar'
let g:php_namespace_sort_after_insert = 1

" Ale configuration "
let g:ale_linters = {'php': ['php']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Whitespace configuration "
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Ag configuration "
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching = 0
  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Theme "
if (has("termguicolors"))
    set termguicolors
endif

try
    colorscheme OceanicNext
catch
endtry

" Airline "
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Load php document "
" filetype on
" autocmd FileType php set keywordprg=pman

" Override "
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Performance in vim"
set cursorline!
set nolazyredraw
set noshowcmd
set synmaxcol=128
set ttyfast
set cul!
set nofoldenable
set foldmethod=indent
syntax sync minlines=256

" auto move back to normal model "
au CursorHoldI * stopinsert

filetype plugin on

" Tabbar configuration
hi TabLineFill cterm=none ctermfg=grey  ctermbg=cyan
hi TabLine     cterm=none ctermfg=white ctermbg=cyan
hi TabLineSel  cterm=none ctermfg=black ctermbg=white

" syntax hightlight vue
autocmd FileType vue syntax sync fromstart
