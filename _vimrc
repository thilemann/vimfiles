" vim:fdm=marker

" Load settings to make Vim behave properly on Windows
source $VIMRUNTIME/mswin.vim
behave mswin

" Autoload vimrc when updated
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" GENERAL {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<CR>

" Switch between windows
:nmap <silent> <A-Up> :wincmd k<CR>
:nmap <silent> <A-Down> :wincmd j<CR>
:nmap <silent> <A-Left> :wincmd h<CR>
:nmap <silent> <A-Right> :wincmd l<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" PLUGINS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load plugings through pathogen plugin manager
" Just put plugins in ~/vimfiles/bundle folder
execute pathogen#infect()

" Show NERDTree when no filebuffer is open
autocmd vimenter * if !argc() | NERDTree | endif

" Show UndoTree
nnoremap <F5> :UndotreeToggle<cr>

" Show NERDTree bookmarks
let NERDTreeShowBookmarks=1

" NERDTree ignore files
let NERDTreeIgnore=['\.o$', '\~$', 'NTUSER.DAT*', '\.lnk', '\.zip', '\.rar', '\.pdf', '\.exe', '\.msi', '\.apk', '\.pdf', '\.gz', '\.png', '\.jpg', '\.gif', '\.ico']

" Display tags of the current file ordered by scope
let g:tagbar_usearrows = 1
let g:tagbar_ctags_bin = '~\vimfiles\ctags58\ctags.exe' 
nnoremap <leader>l :TagbarToggle<CR>

" Vim Airline show buffers as tabs when only one tab is open
let g:airline#extensions#tabline#enabled = 1

" Vim Airline tabline seperators
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" Vim Airline use powerline font symbols
" Requires that a patched font is installed!
let g:airline_powerline_fonts = 1

" Automatically insert close tags in XML like files defined below
autocmd FileType htm,html,xhtml,xml,django,eruby,mako let b:closetag_html_style=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" VIM USER INTERFACE {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Highlight current cursor line and column
:set cursorline

" Commands to enable/disable cursor line/column
:nnoremap <Leader>cv :set cursorcolumn!<CR>
:nnoremap <Leader>cl :set cursorline!<CR>

" Cursor line/column highlighting
:hi CursorLine   cterm=NONE ctermbg=white ctermfg=white guibg=white guifg=white
:hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

" Show tabs if two or more buffers are open
set showtabline=1

" turn on the wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc

"always show current position
set ruler

" height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=3

 "Allows you to click around the text editor with your mouse to move the cursor
set mouse=a

" Highlights matching brackets in programming languages
set showmatch

" If you're indented, new lines will also be indented
set autoindent

" Automatically indents lines after opening a bracket in programming languages
set smartindent

" Enables line numbering
set number

" Improves tabbing
set smarttab

" Lets you hide sections of code
set foldmethod=manual

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Adds a sweet menu, press F4 to use it.
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" COLORS AND FONTS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set colorscheme and options if available
colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    " Removes/shows toolbar
    set guioptions-=T
    " Removes/shows menubar
    set guioptions-=m
    " Removes/shows tab pages
    set guioptions-=e
    
    set guioptions+=r "remove right-hand scroll bar
    set guioptions-=L "remove left-hand scroll bar. Fix for TagBar.

    set t_Co=256
    set guitablabel=%M\ %t

    colorscheme jellybeans

    if has("gui_gtk2")
        set guifont=Inconsolata\ 10
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif

" Change cursor highlight color - overrides colorscheme
" Must come after colorscheme is set!
highlight Cursor guifg=white guibg=darkslategray
highlight iCursor guifg=white guibg=darkslategray

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=dos,unix,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" FILES, BACKUPS AND UNDO {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

set undofile
set undodir=~/vimfiles/undodir//

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" TEXT, TAB AND INDENT RELATED {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" VISUAL MODE RELATED {{{
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" MOVING AROUND, TABS, WINDOWS AND BUFFERS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" STATUS LINE {{{
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" EDITING MAPPINGS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Remap VIM 9 to end of line
map 9 $li

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Press Shift-Space to escape out of insert mode (may not work on your system).
:imap <S-Space> <Esc>

" Shift-Space enters insert mode.
:nmap <S-Space> i

" Or just Space to enter insert mode.
:nmap <Space> i

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" VIMGREP SEARCHING AND COPE DISPLAYING {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" SPELL CHECKING {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" MISC {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" HELPER FUNCTIONS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
