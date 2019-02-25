" PLUGINS (WITH PATHOGEN)

execute pathogen#infect()

call pathogen#helptags()

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

" Highlight current line
set cul

" Highlight spelling mistakes
"set spell

" 6 MULTIPLE WINDOWS

" Hide buffers instead of closing them
set hidden

" A new window is put right of the current one
set splitright

" 7 MULTIPLE TAB PAGES

" 8 TERMINAL

" Fast terminal connection
set ttyfast

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

" Point to the system clipboard, allow (Ctrl+C -> ,p) and (YY -> Ctrl+V)
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

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
au FocusLost * :wa

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

" PYTHON SPECIFIC
autocmd Filetype python setlocal ts=4 sw=4 sts=4

let python_highlight_all = 1

" HIGHLIGHTING

" Line numbers color
highlight LineNr ctermfg=19 ctermbg=18

" Cursor line appearance
highlight CursorLine cterm=NONE ctermbg=18

" Change some standart colors
highlight Function cterm=bold ctermfg=167
highlight String ctermfg=227
highlight Character ctermfg=227
highlight Comment ctermfg=23

" Ale warnings color
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" PLUGINS OPTIONS

" AIRLINE

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Use powerline glyphs
let g:airline_powerline_fonts=1

" Airline theme
let g:airline_theme='base16_spacemacs'

" Get rid of empty triangles
let g:airline_skip_empty_sections=1

" Show current branch
let g:airline#extensions#branch#enabled = 1

" Show tabs
let g:airline#extensions#tabline#enabled = 1

" Show tags
let g:airline#extensions#tagbar#enabled = 1

" Disable whitespace detection
let g:airline#extensions#whitespace#enabled = 0

" GREP
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

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

" Required by MUComplete
set completeopt+=menuone,noselect,noinsert

" Shut off completion messages
set shortmess+=c

" Enable automatic completion at startup
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#no_popup_mappings = 1

" SNIPPETS

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

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
\   'typescript': ['tslint'],
\   'vue': ['eslint']
\}

" Assign default fixers for different filetypes
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'vue': ['eslint']
\}

" Fix files automatically on save
let g:ale_fix_on_save = 1

" Better error symbols
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" TAGBAR
let g:tagbar_autofocus = 1

" AG SEARCH
let g:ag_working_path_mode="r"

" CTRLP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" VIMTEX
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_engine = 'xelatex'

" Start vim with a server
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

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

" Map leader to ,
let mapleader=','

inoremap <expr> <CR> Expander()

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Copy/Paste/Cut from system clipboard
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Toggle file browser
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Center search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Empty lines
nnoremap <Space>[ O<Esc>
nnoremap <Space>] o<Esc>

" Grep
nnoremap <silent> <leader>f :Rgrep<CR>

" Whitespaces
nnoremap <silent> <leader>w :StripWhitespace<CR>

" Autofix
nnoremap <silent> <F8> :ALEFix<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>

" Terminal
nnoremap <silent> <leader>sh :terminal<CR>

" Session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" MUComplete
imap <c-j> <plug>(MUcompleteFwd)
imap <c-k> <plug>(MUcompleteBwd)

inoremap <silent> <plug>(MUcompleteFwdKey) <c-l>
imap <c-l> <plug>(MUcompleteCycFwd)
inoremap <silent> <plug>(MUcompleteBwdKey) <c-h>
imap <c-h> <plug>(MUcompleteCycBwd)

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
