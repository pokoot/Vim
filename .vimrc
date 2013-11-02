set nowrap
set nu
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" ==========
" CUSTOM VIM
" ==========

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Color theme
source $VIMRUNTIME/colors/darkblue.vim

" Common configuration
set fileformat=unix                 " file formatting
set fileformats=unix,dos            " fix file formating for dos
set ruler                           " shows ruler information below the screen
set expandtab
set softtabstop=4
set encoding=utf-8                  " file encoding
set fileencoding=utf8               " file encoding
set nowrap                          " don't wrap lines
set tabstop=4                       " a tab is four spaces
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
set number                          " always show line numbers
set shiftwidth=4                    " number of spaces to use for autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                       " set show matching parenthesis
set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch                        " highlight search terms
set incsearch                       " show search matches as you type
set history=1000                    " remember more commands and search history
set undolevels=1000                 " use many muchos levels of undo


" Custom fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


" CTRL + D = Php Documentator
" Custom codes
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" F6 = Prints the time
:nnoremap <F6> "=strftime("%a, %d %b %Y - %X ")<CR>P
:inoremap <F6> <C-R>=strftime("%a, %d %b %Y - %X ")<CR>

" F8 = Search trailing white spaces
:nnoremap <F8> /\s\+$<CR>

" F4 = Nerdtree
" https://github.com/scrooloose/nerdtree
map <F4> :NERDTreeToggle<CR>

" F5 = Tagbar
" https://github.com/majutsushi/tagbar
map <F5> :TagbarToggle<CR>

" Auto highlight trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Auto strip white spaces on ":w"
autocmd FileType php,html,css,javascript,sql,c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" Backup directory
set backupdir=C:\temp
set directory=C:\temp

" Syntastic
" https://github.com/scrooloose/syntastic
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers=['jslint', 'jsl', 'closurecompiler', 'gjslint' , 'jshint']
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='!'

" CtrlP
" https://github.com/kien/ctrlp.vim
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Omifunction autocomplete
set completeopt-=preview
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#CompleteCpp
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Sqlutilities
" https://github.com/vim-scripts/SQLUtilities
" dependencies:
" https://github.com/vim-scripts/Align
" Help documents:
" http://breestealthconfigure.googlecode.com/svn/trunk/Vim/vimfiles/doc/SQLUtilities.txt
let g:sqlutil_align_where = 1
let g:sqlutil_align_comma = 0
let g:sqlutil_align_first_word = 1
let g:sqlutil_align_keyword_right = 1
