
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-unimpaired'
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vimwiki/vimwiki'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'dracula/vim'
Plugin 'junegunn/goyo.vim'
Bundle 'captbaritone/better-indent-support-for-php-with-html'

let g:ctrlp_custom_ignore = '\v\.(class|o|xcf|jpg|png)$'
let g:ctrlp_working_path_mode = 'rw'
let g:user_emmet_leading_key = '<Q>'

call vundle#end()

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-n> <c-w>n

filetype plugin indent on

set shiftwidth=4
set tabstop=4
set wildmenu
set number

set foldenable
set foldmethod=manual
set foldlevelstart=10

set splitbelow

syntax enable

au BufNewFile,BufRead *.frag,*.vert,*.glsl set filetype=glsl

set exrc
set secure

if &diff
	nnoremap tq :q<cr>:q<cr><cr>
	colorscheme apprentice
endif

"tab mappings

nnoremap th :tabprev<CR>
nnoremap tk :tabfirst<CR>
nnoremap tj :tablast<CR>
nnoremap tl :tabnext<CR>

nnoremap te :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

nnoremap ty :tabedit %<CR>
nnoremap to :tabonly<CR>

nnoremap tq :qa<CR>
nnoremap tw :wqa<CR>

map <F2> :vertical resize 

nnoremap ds :g/^$/d<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 28
let g:netrw_list_hide= netrw_gitignore#Hide()

set foldmethod=manual
nnoremap fl :norm! zfit<cr>
nnoremap fh :norm! zo<cr>
nnoremap fq :norm! zfi{<cr>
nnoremap fw :norm! zfi(<cr>
nnoremap vv :norm! vap<cr>
nnoremap tc :x<cr>

set t_ZH=[3m
set t_ZR=[23m

"
" http://vim.wikia.com/wiki/Modeline_magic
"
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
