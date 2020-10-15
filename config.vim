let mapleader = "'"
let g:quickr_preview_keymaps = 0

" Customize Lightline
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

let s:hidden_all = 0

map  <nowait> e    :e<space>
map  <nowait> r    :w<cr>
" map  <nowait> g    :cn<cr>
" map  <nowait> gg   :cp<cr>
map  <nowait> <silent> c    :NERDTreeFind<cr>
map  <nowait> <silent> cc   :NERDTreeToggle<cr>
nmap     <C-Y>     :%y+<cr>
map      <C-C>     :G
nnoremap <F3>      :DeleteHiddenBuffers<cr>
nmap <nowait> <silent> <esc> :nohlsearch<cr>
map  <nowait> <C-D>     <C-W>v<cr>
map  <nowait> <C-A>     :sp <cr>
nnoremap ; :
map  <nowait> w    :b<space>
map  <nowait> q    :q<cr>

let g:quickr_preview_position = 'above'

inoremap jj <ESC>

set noshowmode
set noshowcmd
set mouse=a
set confirm
set nonumber
set list
set listchars=tab:!·,trail:·
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set tags=./tags,tags;/

" "
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
let g:phpstan_analyse_level = 1

" Improve performance ctrlp with ctrp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Theme "
syntax on
" set termguicolors
" let ayucolor="mirage"
" colorscheme ayu
colorscheme hashpunk-sw

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeAutoDeleteBuffer = 1
let g:loaded_nerdtree_git_status = 1

" General and Performance in vim "
syntax sync minlines=300
set lazyredraw
set noshowcmd
set synmaxcol=128
set ttyfast
set cul!
set nocp
set ruler
set wildmenu
set nofoldenable
set foldmethod=indent
set timeoutlen=1000
set ttimeoutlen=0
set re=1

" let g:vue_disable_pre_processors=1

" auto move back to normal model "
" au CursorHoldI * stopinsert

filetype plugin on
filetype plugin indent on

" Tabbar configuration
hi TabLineFill cterm=none ctermfg=grey  ctermbg=cyan
hi TabLine     cterm=none ctermfg=white ctermbg=cyan
hi TabLineSel  cterm=none ctermfg=black ctermbg=white

" Enable phpcstags
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_phpctags_memory_limit='512M'

" Ignore matching
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2


" Utilsnip
" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0
" let g:UltiSnipsExpandTrigger           = '<tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.md'

" Auto find and insert namespace
autocmd FileType vue syntax sync fromstart
autocmd FileType markdown setlocal syntax=off nospell
autocmd FileType php autocmd BufWritePre <buffer> :call PhpSortUse()
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tpl syntax smarty

aug Ws
   au!
aug END

let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

command! Ctabs call s:Ctabs()
function! s:Ctabs()
  let files = {}
  for entry in getqflist()
    let filename = bufname(entry.bufnr)
    let files[filename] = 1
  endfor

  for file in keys(files)
    silent exe "tabedit ".file
  endfor
endfunction

" COC
let g:coc_disable_startup_warning = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
set pumheight=10
