"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here
Plugin 'scrooloose/syntastic'
Plugin 'xml.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/ListToggle'
Plugin 'a.vim'
Plugin 'http://github.com/sjl/gundo.vim.git'
Plugin 'matchit.zip'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-pencil'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-signify'
Plugin 'reedes/vim-lexical'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700
"
" Enable filetype plugins
filetype plugin on
filetype indent on
"
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Redefine mouse Middle Click behavior
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

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
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Use Listchars to add visiual markers for whitespace
set listchars=tab:>-,eol:¬,space:·,extends:#,precedes:>
set list

" Set Colorshemes (and override some of the listchars highlights)
if has('gui_running')
    set background=dark
    colorscheme solarized
    hi SpecialKey term=bold ctermfg=9 gui=bold guifg=#657b83 guibg=NONE
    hi NonText term=bold ctermfg=9 gui=bold guifg=#657b83 guibg=NONE
    set guioptions-=T "remove toolbar

else
    colorscheme zenburn
    hi SpecialKey term=bold ctermfg=239 guifg=#9ece9e guibg=#444444
    hi NonText term=bold ctermfg=240 gui=bold guifg=#5b605e
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Always turn on line numbering
set nu

" Default to splitting behavior
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure default statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Keep the statusline active at all times
set laststatus=2

" Tell Airline not to show trailing whitespace
let g:airline#extensions#whitespace#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L
nnoremap <C-H> <C-W><C-H>

" more sane normal mode transitions and
" fixes to the :W vs :w problem
map ; :
noremap ;; ;

" for overkill, we will also setup commands for the capilalized versions
cabbrev WQ wq
cabbrev Wq wq
cabbrev W w
cabbrev Q q


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (Plugin)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite (Plugin):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec<cr>
nnoremap <leader>j :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neocomplete (Plugin):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl ='\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo (Plugin):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Signify (Plugin):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:signify_vcs_list = [ 'svn', 'git' ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Text Objects (Plugin):
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:textobj_python_no_default_key_mappings = 1

xmap aF <Plug>(textobj-python-function-a)
omap aF <Plug>(textobj-python-function-a)
xmap iF <Plug>(textobj-python-function-i)
omap iF <Plug>(textobj-python-function-i)

xmap aC <Plug>(textobj-python-class-a)
omap aC <Plug>(textobj-python-class-a)
xmap iC <Plug>(textobj-python-class-i)
omap iC <Plug>(textobj-python-class-i)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autogroups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType xsd setlocal shiftwidth=2 tabstop=2
