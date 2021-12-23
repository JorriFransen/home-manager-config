set cursorline
set number
set relativenumber

set mouse=a
set clipboard^=unnamed,unnamedplus

set hlsearch
set ignorecase
set smartcase

set scrolloff=5
set splitbelow
set splitright

set backspace=start,eol,indent
set shiftwidth=4
set tabstop=4
set expandtab

set hidden
set noswapfile
set noundofile

set signcolumn=number

set termguicolors
colorscheme gruvbox
let g:airline_theme='gruvbox'

let mapleader = " "
map <leader>; <plug>NERDCommenterToggle
inoremap {<CR> {<CR>}<Esc>O

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>frg :Rg<cr>

noremap <leader>h :wincmd h<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>wv :vsplit<cr>
noremap <leader>ws :split<cr>

noremap <leader>thh :noh<CR>
noremap <leader>tt :wincmd T<CR>
noremap <leader>T :tabe<CR>:terminal<CR>i<CR>
noremap <C-h> :tabp<CR>
noremap <C-l> :tabn<CR>
tnoremap <C-h> <C-\><C-n>:tabp<CR>
tnoremap <C-l> <C-\><C-n>:tabn<CR>
nnoremap <F5> :call Compile()<CR>
inoremap <F5> <esc>: call Compile()<CR>
nnoremap <leader>cd :call ToggleQuickfix()<CR>
nnoremap <leader>en :cn<cr>
nnoremap <C-j> :cn<cr>
nnoremap <leader>ep :cp<cr>
nnoremap <C-k> :cp<cr>

noremap <leader>ga :ClangdSwitchSourceHeader<CR>

set listchars=eol:·,tab:⍿·,trail:×
set list

let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true

function! ToggleQuickfix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction


" set completeopt=menu,menuone,noselect

"
" Begin coc config
"

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

"
" End coc config
"
"
