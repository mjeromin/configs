" vimrc options -- Also see: http://vimdoc.sourceforge.net/htmldoc/options.html

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set backspace=indent,eol,start  " enable the working of <BS>/<DEL> over everything in insert mode
set autoindent                  " enable autoindenting
" set backup		        " keep a backup file
set history=50		        " keep 50 lines of command line history
set ruler                       " show the line and column number of the cursor position 

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" In many terminal emulators the mouse works just fine, but lately I find it annoying
"if has('mouse')
"  set mouse=a
"endif

" Redefine tab as 4 spaces, Stack Overflow answer from Laurence Gonsalves
" stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
"
" Also added some PEP-8 choices.
set tabstop=4      " The width of the hard tabstop in spaces (ie. maximum width)

set softtabstop=0  " Setting this to a non-zero value other than tabstop will make the tab key (in insert mode)
                   " insert a combination of spaces (and possibly tabs) to simulate tab stops at this width. 

set expandtab      " Enabling this will make the tab key (in insert mode) insert spaces instead of tab characters.
                   " This also affects the behavior of the retab command.

set shiftwidth=4   " The size of an 'indent'. It's also measured in spaces, so if your code base indents with tab characters
                   " then you want shiftwidth to equal the number of tab characters times tabstop. This is also used by things
                   " like the =, > and < commands. 

set smarttab       " Enabling this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the
                   " next tabstop when the cursor is at the beginning of a line (i.e. the only preceding characters are whitespace).

set textwidth=79   " lines longer than 79 columns will be broken

set shiftround     " round indent to multiple of 'shiftwidth'

set autoindent     " align the new line indent with the previous line

" Python mode for processing IDE files
augroup filetypedetect
    au BufRead,BufNewFile *.pyde setfiletype python
    " associate *.pyde with python filetype
augroup END

" Map key to toggle option and display option value after toggle
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" Shift-F5 - toggles line numbers
MapToggle <S-F5> number

" Shift-F6 - toggles list mode (ie. uncover tabs vs spaces)
MapToggle <S-F6> list

" Shift-F7 - toggles auto-wrap for long lines
MapToggle <S-F7> wrap

" Shift-F8 - toggles paste mode
MapToggle <S-F8> paste

" Shift-Up - toggles encryption and will prompt for password (masked with *)
map <S-Up> :setlocal cm=blowfish2<CR> :X<CR>
