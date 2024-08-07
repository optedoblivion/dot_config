"------------------------------------------------
" Plugins START
call plug#begin()
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-buftabline'
  Plug 'cespare/vim-toml'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-commentary'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'preservim/nerdtree'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  Plug 'vim-airline/vim-airline'
  Plug 'DreamMaoMao/yazi.nvim'
  Plug 'vim-scripts/TaskList.vim'
call plug#end()
" Plugins END
"------------------------------------------------

"------------------------------------------------
" Settings START
let mapleader = "\<Space>"
filetype plugin on
set completeopt=menuone
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set number
set signcolumn=yes
set title
set wrap
setlocal wrap
" Settings END
"------------------------------------------------

"------------------------------------------------
" persist START
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Persist cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
" persist END
"------------------------------------------------

"------------------------------------------------
" NvimTree START
"set vim.g.loaded_netrw = 1
"set vim.g.loaded_netrwPlugin = 1
"set vim.opt.termguicolors = true

"require("nvim-tree").setup()
" NvimTree END
"------------------------------------------------

"------------------------------------------------
" Theme START
syntax on
syntax enable
set cursorline
"" set cursorcolumn                    " Highlights cursor column.
set hidden
set cmdheight=1
set laststatus=2
set showtabline=2
set list
set listchars=tab:\|·,trail:·
set termguicolors
set background=dark
let g:gruvbox_transp_bg=0
let g:gruvbox_italics=1
let g:gruvbox_italicize_strings=0
let g:gruvbox_bold=0
colorscheme gruvbox8

hi StatusLine guibg=#928374 guifg=#3c3836
hi SignColumn guibg=#282828

hi CocErrorSign guifg=#fb4934
hi CocWarningSign guifg=#fabd2f
hi CocInfoSign guifg=#83a598
hi CocHintSign guifg=#504945
hi CocErrorFloat guifg=#fb4934
hi CocWarningFloat guifg=#fabd2f
hi CocInfoFloat guifg=#83a598
hi CocHintFloat guifg=#d3869b
" hi CocDiagnosticsError guibg=#282828 guifg=#282828
" hi CocDiagnosticsWarning guibg=#282828 guifg=#282828
" hi CocDiagnosticsInfo guibg=#282828 guifg=#282828
" hi CocDiagnosticsHint guibg=#282828 guifg=#282828

hi CocSelectedText guibg=#3c3836 guifg=#282828
hi CocCodeLens guifg=#504945
" Theme END
"------------------------------------------------

"------------------------------------------------
" Remaps START
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Toggle between buffers
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nnoremap <C-p> :Rg<Cr>
nnoremap <C-e> :Files<Cr>
nmap <Leader>bl :Buffers<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>e :Files<CR>
nmap <Leader>p :Rg<CR>
nmap <Leader>g? :GFiles?<CR>
nmap <Leader>h :History<CR>
" Remaps END
"------------------------------------------------

"------------------------------------------------
" Coc START
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ga  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> t<space>k  :<C-u>CocPrev<CR>

augroup startup
  "" When editing a file, always jump to the last known cursor position.
  "" Don't do it when the position is invalid or when inside an event
  "" handler.
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \       exe "normal! g`\"" |
      \ endif
augroup END

"" NERDTree
nnoremap <silent> <F2> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.svn$', '\.git$']

"" Ranger + NERDTree
let g:NERDTreeHijackNetrw = 1
let g:ranger_replace_netrw = 1

"" Highlights
""highlight OverLength ctermbg=red ctermfg=white guibg=#592929
""match OverLength /\%100v.*/
set textwidth=100
let &colorcolumn=join(range(100,100), ",")
highlight ColorColumn ctermbg=234
highlight TrailingWhitespace ctermbg=yellow guibg=yellow
match TrailingWhitespace /\s\+$/

"" Status Line
"set ch=2                           " Make command line two lines high.
set showcmd                         "
set ruler                           " Display ruler.
set history=50                      " Keep 50 lines of comand line history.

"" Encoding
set encoding=utf-8

"" Directories
set backupdir=~/.vimbackup          " Set backup location.
set backup                          " Enable backups.
set directory=~/.vimbackup/swap     " Set swap directory.

"" Line Wrapping
set nowrap
set linebreak

"" Status Line
"set ch=2                           " Make command line two lines high.
set showcmd                         "
set ruler                           " Display ruler.
set history=50                      " Keep 50 lines of comand line history.

"" Mouse
set mouse=a                         " Enable mouse
"" behave xterm
set selectmode=mouse

"" Searching
"set ignorecase                     " Ignore case when searching.
set hlsearch                        " Highlight Search.
set incsearch                       " Incremental Search (Search as you type).
set smartcase                       " Ignore case when searching lowercase.

"" Windows
set equalalways
set splitbelow splitright

"" Line numbers
set numberwidth=4
set nu

:
"" Tabs (PEP 8)
set softtabstop=4
set shiftwidth=4
set tabstop=8
set expandtab
set sta

"" Indenting
set ai
set si

"" Scrollbars
set sidescrolloff=2

"" File manager
if !exists('g:yazi_map_keys') || g:yazi_map_keys
    map <leader>y :Yazi<CR>
endif

"" Misc.
set sw=4
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.
let g:clipbrdDefaultReg = "+"

"" Custom
nnoremap <silent> <C-f>w <Esc>:%s/\s\+$//g<CR>
nnoremap <S-Enter> O<ESC>
nnoremap <Enter> o<ESC>
