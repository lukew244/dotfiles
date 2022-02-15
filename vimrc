"Editor settings

colorscheme molokai
syntax on
set guifont=Monaco
"set termguicolors                " Use same colours in terminal windows (fzf)

set number                        " Show line numbers
set ruler                         " Show line and column number
set encoding=utf-8                " Set default encoding to UTF-8

set autoindent                    " Automatically indent lines

filetype on
filetype plugin on                " Required for nerdcommenter & indentation
filetype indent on                " Determine amount of indentation based on filetype

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set backspace=indent,eol,start    " backspace through everything in insert mode
"set list                         " Show invisible characters

set hlsearch                      " highlight search results
set incsearch                     " search while typing
set ignorecase                    " case insensitive searching with /
set smartcase                     " case sensitive if search contains uppercase letter


set laststatus=2                  " always show the status bar
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n
set statusline+=[%b][0x%B]

set wildignore+=*.swp,*~,._*      " Disable temp and backup files
set backupdir^=~/.vim/_backup//   " where to put backup files.
set directory^=~/.vim/_temp//     " where to put swap files.


"Key maps

"remap 0 to first non blank character
map 0 ^

inoremap jj <Esc>
nnoremap <Esc> :noh<return><Esc>

map <C-p> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>

map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Bubble mappings depend on the unimpaired plugin to work
" Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
nmap <D-k> [e
nmap <D-j> ]e

" Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv
vmap <D-k> [egv
vmap <D-j> ]egv

"Plugins

"Show hidden files in nerdtree by default
let g:NERDTreeShowHidden=1

"Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

"Allow ALE to autofix on save
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\}

"ZSH - Include symlinks (follow), hidden, not ignore version control, do ignore specified folders
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,tmp/*,log/*}"'

"Colours for fzf

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" Abbreviations

iabbrev fc const = () => {<CR>};<Up><Esc>ft<Right>i
iabbrev fcr return (<CR><CR>)<Up><Space>
iabbrev fct useEffect(() => {}, []);<Left><Left><Left>
