" PLUGINS (WITH PATHOGEN)

execute pathogen#infect()

" SETTINGS

" 1 IMPORTANT

" 2 MOVING AROUND, SEARCHING AND PATTERNS

" Ignore case when using a search pattern
set ignorecase

" Override 'ignorecase' when pattern has upper case characters
set smartcase

" 3 TAGS

" 4 DISPLAYING TEXT

" Show the line number for each line
set number

" Show the relative line number for each line
set relativenumber

" Number of columns to use for the line number
set numberwidth=5

" 5 SYNTAX, HIGHLIGHTING AND SPELLING

" The background color brightness
set background=dark

" Filetype handling
filetype plugin indent on

" Syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif

" Highlight all search pattern matches
set hlsearch

" Highlight spelling mistakes
"set spell

" 6 MULTIPLE WINDOWS

" Hide buffers instead of closing them
set hidden

" A new window is put right of the current one
set splitright

" 7 MULTIPLE TAB PAGES

" 8 TERMINAL

" 9 USING THE MOUSE

" 10 GUI

" 11 PRINTING
 
" 12 MESSAGES AND INFO

" Show info about current command
set showcmd

" Don't repeat current mode info, already shown in airline
set noshowmode

" Don't repeat ruler info, already shown in airline
set noru

" Don't report number of changed lines
set report=0

" Start a dialog when a command fails
set confirm

" 13 SELECTING TEXT

" Point to the system clipboard, allow (Ctrl+C -> p) and (y -> Ctrl+V)
set clipboard=unnamedplus

" 14 EDITING TEXT

" Allow the backspace to behave normally (deleting indentation, line breaks, pre-existing characters) while in insert mode
set backspace=indent,eol,start

" 15 TABS AND INDENTING

" Automatically set the indent of a new line
set autoindent

" Do clever autoindenting
set smartindent

" Insert space characters whenever the tab key is pressed
set expandtab

set tabstop=2
set shiftwidth=2
set softtabstop=2

" 16 FOLDING

" 17 DIFF MODE

" 18 MAPPING

" 19 READING AND WRITING FILES

" Autosave
au FocusLost * :wa

" Automatically write a file when leaving a modified buffer
set autowrite

" Always write without asking for confirmation
set writeany

" Automatically read a file when it was modified outside of Vim
set autoread

" 20 THE SWAP FILE

" Disable swap files
set noswf

" 21 COMMAND LINE EDITING

" Ignore case when using file names
set fileignorecase

" Ignore case when completing file names
set wildignorecase

" Command-line completion shows a list of matches
set wildmenu

" 22 EXECUTING EXTERNAL COMMANDS

" 23 RUNNING MAKE AND JUMPING TO ERRORS

" 24 LANGUAGE SPECIFIC

" 25 MULTI-BYTE CHARACTERS

" 26 VARIOUS

" Extended % matching
runtime macros/matchit.vim

" Line numbers color
highlight LineNr ctermfg=19 ctermbg=18

" PLUGINS OPTIONS

" AIRLINE

" Use powerline glyphs
let g:airline_powerline_fonts=1

" Airline theme
let g:airline_theme='base16_spacemacs'

" Get rid of empty triangles
let g:airline_skip_empty_sections=1

" NERDTREE

" Show dot files in filemanager
let NERDTreeShowHidden=1

" TMUXLINE

" Tmuxline contents
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '#(whoami)',
      \'z'    : '#H',
      \'options': {
      \  'status-justify': 'left'
      \}
\}

" AUTOCOMPLETION

" YouCompleteMe Engine
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'

" SNIPPETS

" Trigger configuration
let g:UltiSnipsExpandTrigger = '<Insert>'
let g:UltiSnipsJumpForwardTrigger = '<Insert>'

" Make :UltiSnipsEdit to split the window
let g:UltiSnipsEditSplit = 'vertical'

" Snippets path
let g:UltiSnipsSnippetDirectories = ['~/.vim/snippets']

" JSON

" No syntax concealing in JSON files
let g:vim_json_syntax_conceal = 0

" LINTER

" Assign default linters for different filetypes
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Assign default fixers for different filetypes
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

" Fix files automatically on save
let g:ale_fix_on_save = 1

" KEY MAPPINGS

function! Expander()

  let line   = getline(".")
  let col    = col(".")
  let before  = line[col-2]
  let after = line[col-1]

  if before ==# ">" && after ==# "<"
    return "\<CR>\<C-o>==\<C-o>O"

  elseif before ==# "(" && after ==# ")"
    return "\<CR>\<C-o>==\<C-o>O"

  elseif before ==# "[" && after ==# "]"
    return "\<CR>\<C-o>==\<C-o>O"

  elseif before ==# "{" && after ==# "}"
    return "\<CR>\<C-o>==\<C-o>O"

  else
    return "\<CR>"

  endif

endfunction

inoremap <expr> <CR> Expander()
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <Space>[ O<Esc>
nnoremap <Space>] o<Esc>
nnoremap <silent> <F8> :ALEFix<CR>

