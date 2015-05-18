" FIXME: 
" Install ctags, cscope, put cscope_maps.vim into .vim/plugin
" YouCompleteMe: need to compile.
" vim-php-dictionary: get a updated dictionary from php.net
"
"##############################################################
"# Common VIM settings
"##############################################################
" Enable Chinese input and output
let &termencoding=&encoding
set fileencodings=utf-8,gbk
" No compatible with VI
set nocompatible
set backspace=indent,eol,start
set showcmd " 命令行显示输入的命令
set showmode " 命令行显示vim当前模式

" Automatically complete " ' ( { [
set incsearch " 输入字符串就显示匹配点
set history=100 " set command history to 100
set number
set cursorline
" set cursorcolumn

"折叠
set foldmethod=syntax
set foldlevel=200
"zc zo

" Programming Settings: Syntax highlight
syntax on
set autoindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
"TODO: For script, is it neccesary?
set cindent " 使用 C/C++ 语言的自动缩进方式

" Detect file type
filetype off
filetype plugin on
filetype plugin indent on

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Set leader
let mapleader = "," 

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
	!git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

" FOR Linux Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" For windows, install git before installing
" set rtp+=$VIM/vimfiles/bundle/vundle/
" call vundle#rc('$VIM/vimfiles/bundle/') 

" Install bundle of plugins with vundle
"#############################################################
"# Common plugins
"#############################################################
Bundle 'gmarik/vundle'
" Ctrl-P: to search files
Bundle 'kien/ctrlp.vim'						
Bundle 'jasoncodes/ctrlp-modified.vim'
Bundle 'tacahiroy/ctrlp-funky'
" Work with ctrl-P, ctags to search tag
Bundle 'L9'
Bundle 'FuzzyFinder'

" Automatically complete [ ' {
Bundle 'Auto-Pairs'
Bundle 'tpope/vim-surround'
" , nt: Directory tree in the right side
Bundle 'scrooloose/nerdtree'				
" , nb: taglist in the left side
Bundle 'majutsushi/tagbar'					
" , mb: buffer windows in the top side
Bundle 'fholgado/minibufexpl.vim'			
" colorful status bar
Bundle 'bling/vim-airline'
" Jump to the specific position
Bundle 'Lokaltog/vim-easymotion'			
" colorful parentheses
Bundle 'kien/rainbow_parentheses.vim'		
" ,tl: show the todo list
Bundle 'vim-scripts/TaskList.vim'
"Syntax check for various types of files.
Bundle 'scrooloose/syntastic'
" autocomment
Bundle 'scrooloose/nerdcommenter'
"snippets
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Valloric/YouCompleteMe'
" Alginment
Bundle 'godlygeek/tabular'
Bundle 'flazz/vim-colorschemes'
Bundle 'mbriggs/mark.vim'

" This plugins are assistant for coding, if it affect the performace
" they can be removed.
"Bundle 'Yggdroot/indentLine'
"let g:indentLine_char = '┊'

"##############################################################
"# Web Development
"##############################################################
" For PHP plugins
Bundle 'joonty/vim-phpunitqf'
Bundle 'alvan/vim-php-manual'
Bundle 'joonty/vdebug.git'
Bundle 'nishigori/vim-php-dictionary'

"press SHIFT-k to view the Explanation of the keyword under the cursor
"press CTRL-ALT-k to see the online manual of the keyword under the cursor

"Ctrl-y ,: complete html/css code
Bundle 'mattn/emmet-vim'

"Javascript plugins
Bundle 'pangloss/vim-javascript'

"CSS color preview.
Bundle "lilydjwg/colorizer"
Bundle "hail2u/vim-css3-syntax"
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

Bundle 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery'

"##############################################################
"# Script Development
"##############################################################

"For Python
Bundle 'klen/python-mode'
""Bundle 'dhalter/jedi-vim'

set t_Co=256
colorscheme colorful256

" For common usage
"##############################################################
"# Author info Settings
"##############################################################

"##############################################################
"# vim-surround and Auto-Pairs Settings
"##############################################################
let g:AutoPairsShortcutFastWrap = '<C-w>'

"##############################################################
"# Quickfix Settings
"##############################################################
nmap <leader><leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>
" Automatically search for the words
autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr> 
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
"set makeprg=make\ sw_octeon6600-mc-stdeb\ -j8

nmap <silent> <F4> :execute 'noautocmd vimgrep /\v(TODO\|FIXME)/ '.expand('%')<cr>:copen<cr>:cc<cr>
nmap <leader>s :execute 'noautocmd vimgrep /'.expand('<cword>').'/j **/*.'.expand('%:e')<cr>:copen<cr>
nmap <leader>g :execute 'noautocmd vimgrep /'.expand('<cword>').'/j **/*'<cr>:copen<cr>
nmap <leader>S :execute 'noautocmd vimgrep /'.expand('<cword>').'/gj '.expand('%')<cr>:copen<cr>
nmap <leader>z :noautocmd vimgrep // **/*.*<left><left><left><left><left><left><left><left>

"##############################################################
"# vim-airline Setings
"##############################################################
set laststatus=2
set t_Co=256

"##############################################################
"# ctrlp.vim settings
"##############################################################
" Set the working directory of ctrlp
"let g:ctrlp_working_path_mode = 'c'
"c - 当前文件所在的目录。
"a - 类似 "c",但是只有在CtrlP之外的当前工作目录不是当前文件所在
"目录的直接祖先时才生效
"r - 包含下列文件或者目录的最近的祖先:.git .hg .svn .bzr _darcs
"w - 开始从CtrlP的工作目录之外的目录，而不是当前文件所在的目录
"（默认）查找根目录。只有在"r"选项存在的时候才生效。
"0 或者 <empty> - 禁用这项功能。

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'   " Very Slow
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" For ctrlp-modified if there is git
"map <Leader>m :CtrlPModified<CR>
"map <Leader>M :CtrlPBranch<CR>

" For fuzzy
"let g:ctrlp_extensions = ['funky','tag', 'quickfix']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fz :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"##############################################################
"# Ultisnips Settings
"##############################################################
let g:UltiSnipsUsePythonVersion = 2

let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetDirectories =['UltiSnips']

let g:UltiSnipsExpandTrigger="<c-l>"                                            
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"##############################################################
"# Auto-Pairs Settings
"##############################################################
" Default settings.
"let g:AutoPairsFlyMode = 0
"let g:AutoPairsShortcutBackInsert = '<M-b>'

"##############################################################
"# FuzzyFinder Settings
"##############################################################
"let g:fuf_modesDisable = []
"let g:fuf_mrufile_maxItem = 400
"let g:fuf_mrucmd_maxItem = 400

nnoremap <silent> fb     :FufBuffer<CR>
nnoremap <silent> ft     :FufTag<CR>
nnoremap <silent> fq     :FufQuickfix<CR>

"##############################################################
"# mark.vim Settings
"##############################################################
nmap <silent> <leader>hl <Plug>MarkSet
vmap <silent> <leader>hl <Plug>MarkSet
nmap <silent> <leader>hh <Plug>MarkClear
vmap <silent> <leader>hh <Plug>MarkClear
nmap <silent> <leader>hr <Plug>MarkRegex
vmap <silent> <leader>hr <Plug>MarkRegex

"##############################################################
"# NerdTree Settings
"##############################################################
nmap <leader>nt :NERDTreeMirror<CR>
nmap <leader>nt :NERDTreeToggle<CR>
"nmap <leader>nnt :NERDTreeClose<CR>

let NERDTreeWinPos = 'right'
let NERDTreeIgnore=['\.jpg$', '\.o$', '\.ko$', '\.symvers$', '\.order$', '\.mod.c$', '\.swp$', '\.bak$', '\~$']
"let NERDTreeMinimalUI=1
"let NERDTreeQuitOnOpen=1
"let NERDTreeWinSize=30
"autocmd VimEnter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			elseif winnr("$") == 2
				if bufwinnr("__Tag_List__") != -1
					q
				endif
			endif
		 endif
	endif
endfunction

"##############################################################
"# tagbar Settings
"##############################################################
"autocmd VimEnter * Tagbar 
nmap <Leader>tb :TagbarToggle<CR>
nmap <leader>ntb :TagbarClose<CR>

let g:tagbar_width=35
let g:tagbar_left = 1

"##############################################################
"# minibufferexpl Settings
"##############################################################
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerAutoStart = 0
nmap <Leader>mb :MBEOpen<cr>
nmap <Leader>nmb :MBEClose<cr>

"##############################################################
"#  rainbow_parentheses Settings
"##############################################################
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"nmap <F10> :RainbowParenthesesToggle <CR >

"##############################################################
"# nerdcommenter Settings
"##############################################################
let NERDSpaceDelims = 1 " 在左注释之后/右注释之前留有空格
",ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
",cc，注释当前行
",cs，以”性感”的方式注释
",cu，取消注释

"##############################################################
"# easy-motion Settings
"##############################################################
"<Leader>f{char}      | Find {char} to the right
"<Leader>t{char}      | Till before the {char} to the right.                                                
"<Leader>w            | Beginning of word forward. 
"<Leader>b            | Beginning of word backward.
"<Leader>e            | End of word forward.
"<Leader>j            | Line downward.
"<Leader>k            | Line upward.
"<Leader>n            | Jump to latest "/" or "?" forward.                                        
"<Leader>s            | Find(Search) {char} forward and backward.   

"##############################################################
"# TaskList Settings
"##############################################################
map <leader>tl <Plug>TaskList

"##############################################################
"# YouCompleteMe Settings
"##############################################################
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" Don't load ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>ycm :YcmDiags<CR>
"ctr-l-i ctrl-o

"##############################################################
"# syntastic Settings
"##############################################################
"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_highlighting = 1 

let g:syntastic_javascript_checkers = ['jshint']

"##############################################################
"# BASH Support
"##############################################################
let g:BASH_AuthorName   = 'Miao Guodong'
let g:BASH_Email        = 'omiao@outlook.com'
let g:BASH_Company      = 'Dell Corparation'

"##############################################################
"# Web Development
"##############################################################


"##############################################################
"# emmet-vim
"##############################################################
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

" Enable emmet for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"#(div id)page>(子标签)div.logo+（同级标签）ul#navigation>li*(迭代)5>a{Item$}(innerHTML)

"##############################################################
"# PHP setting
"##############################################################
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
	set dictionary-=~/.vim/bundle/vim-php-dictionary/dict/PHP.dict dictionary+=~/.vim/bundle/vim-php-dictionary/dict/PHP.dict
	set complete-=k complete+=k
endfunction

"##############################################################
"# Python setting
"##############################################################
" For python-mode
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_python = 'python' "or python3, disable
"let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_lint_on_write = 1
"let g:pymode_rope_goto_definition_cmd = 'new'"or vnew
let g:pymode_warnings = 0
let g:pymode_lint_ignore = "E501,E201,E202,E211,E212,W"
