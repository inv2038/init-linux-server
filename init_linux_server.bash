# Update pachages.
sudo apt-get update
# Install tools.
sudo apt-get install -y tmux neovim git
# Write tmux config.
echo "set -g mouse on

set -g base-index 1

unbind C-b
set-option -g prefix M-b
set-option -g prefix2 C-b
bind-key M-b send-prefix

set-window-option -g mode-keys vi" > .tmux.conf
# Mare dir for nvim config.
mkdir -p .config/nvim/
# Write nvim config.
echo "set number
syntax on
set t_Co=256
colorscheme delek
\" set guifont=Courier\ New:h11
autocmd BufRead,BufNewFile *.py setlocal cc=78
filetype on
let python_highlight_all=1
set mouse=a
set mousemodel=popup_setpos
set nowrap
set linebreak
\"  Indentations
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py :%s/\s\+$//e
\"  Optimization
set lazyredraw
\"  Code floading
set foldignore=\"\"
set foldmethod=indent
set foldlevelstart=99
\"  Dont create swap files!
set noswapfile
set nobackup
\"  Encodings
set encoding=utf-8
set termencoding=utf-8
\"  Dont hightlight search results
nnoremap ,<Space> :nohlsearch<CR>
\"  Navigation
imap jk <Esc>
nnoremap <CR> i<Right><CR><ESC>
nnoremap <BS> i<BS><Right><ESC>
function! WinMove(key)
    let t:curwin = winnr()
    exec \"wincmd \".a:key

    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif

        exec \"wincmd \".a:key
    endif
endfunction

nnoremap <A-h> :call WinMove('h')<CR>
nnoremap <A-j> :call WinMove('j')<CR>
nnoremap <A-k> :call WinMove('k')<CR>
nnoremap <A-l> :call WinMove('l')<CR>

let g:netrw_liststyle = 3
\" let g:netrw_browse_split = 3
" > .config/nvim/init.vim
