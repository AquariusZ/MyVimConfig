" base config set {
  set number	" Show line numbers
  set linebreak	" Break lines at word (requires Wrap lines)
  "set showbreak=+++	" Wrap-broken line prefix
  set textwidth=100	" Line wrap (number of cols)
  set showmatch	" Highlight matching brace
  set spell	" Enable spell-checking
  set visualbell	" Use visual bell (no beeping)
  set number	" Show lighlight all search results
  set smartcase	" Enable smart-case search
  set ignorecase	" Always case-insensitive
  set incsearch	" Searches for strings incrementally
  set foldenable
  set foldmethod=indent
  set nofoldenable
  set autoindent	" Auto-indent new lines
  set expandtab
  set shiftwidth=2	" Number of auto-indent spaces
  set smartindent	" Enable smart-indent
  set tabstop=2
  set smarttab	" Enable smart-tabs
  set softtabstop=2	" Number of spaces per Tab
  set scrolloff=10
  " Advanced
  set ruler	" Show row and column ruler information
  set autoread
  set autochdir	" Change working directory to open buffer
  set autowriteall	" Auto-write all file changes
  set undolevels=1000	" Number of undo levels
  set backspace=indent,eol,start	" Backspace behaviour
  set laststatus=2
  set clipboard=unnamed
  set cmdheight=2
  set encoding=utf8
  set nobackup
  set nowb
  set noswapfile
  filetype plugin on
  filetype indent on
  colorscheme gruvbox
  set background=dark    " Setting dark mode
  "set background=light   " Setting light mode
" }

let mapleader = ' ' "map to <space>

"map key {
  noremap <leader>w :w!<cr>
  noremap <leader>q :x<cr>
  noremap ; :
  vnoremap ; :

  map <leader>j <C-W>j
  map <leader>k <C-W>k
  map <leader>h <C-W>h
  map <leader>l <C-W>l

  inoremap jj <Esc>

  nnoremap n nzz
  nnoremap N Nzz
  nnoremap * *zz
  nnoremap # #zz
  nnoremap g* g*zz
  nnoremap g# g#zz

  noremap <leader>v :edit $MYVIMRC<cr>

  noremap <leader>V :source $MYVIMRC<cr> <bar> :echom "reolad config file"<cr>


  vnoremap < <gv
  vnoremap > >gv
  map 0 ^
" }


"config plug {
  call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'w0rp/ale'
  Plug '/usr/local/bin/fzf'
  Plug 'scrooloose/nerdcommenter'
  Plug 'easymotion/vim-easymotion'
  Plug 'mileszs/ack.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'tpope/vim-surround'
  Plug 'majutsushi/tagbar'
  Plug 'honza/vim-snippets'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Yggdroot/indentLine'
  Plug 'mbbill/undotree'
  call plug#end()
"}

"coc base config {
  set hidden
  set nowritebackup
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
  call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)


  if !has('gui_running')
    set t_Co=256
  endif
  " Add diagnostic info for https://github.com/itchyny/lightline.vim
  let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             ['gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'gitbranch': 'fugitive#head'
  \ },
  \}
    function! LightlineGitBlame() abort
      let blame = get(b:, 'coc_git_blame', '')
    " return blame
      return winwidth(0) > 120 ? blame : ''
    endfunction
  "coc-snippet config {
  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)

  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)

  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'

  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'

  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)
"}

"nerdtree {
  noremap <leader>n :NERDTreeToggle<cr>
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  "}

"ale {
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint']
  \}
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)

  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 1
  let g:ale_open_list = 1
  let g:ale_fix_on_save = 1
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"}

"nerdcommenter {
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1

  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
"}

"easymotion config {
  nmap ss <Plug>(easymotion-overwin-f2)
" }

"ack config {
  if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  endif
  nnoremap <Leader>ac :Ack!<Space>
" }

"ctrlp {
  let g:ctrlp_map = '<c-p>'
" }
"tagbar {
  nmap <leader>t :TagbarToggle<CR>
" }
"multi cursor {
  "let g:multi_cursor_use_default_mapping=0
"}

" indent config {
  let g:indentLine_setColors = 0
  let g:indentLine_setConceal = 0
" }
" vim-fugitive config {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    " Mnemonic _i_nteractive
    nnoremap <silent> <leader>gi :Git add -p %<CR>
    nnoremap <silent> <leader>gg :SignifyToggle<CR>
" }
" undotree config {
  nnoremap <leader>u :UndotreeToggle<cr>
  if has("persistent_undo")
      set undodir=$HOME."/.undodir"
      set undofile
  endif
" }
