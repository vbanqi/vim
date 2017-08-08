" System vimrc file for MacVim
" git clone https: "github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix,dos
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

filetype off

set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠

set number                      " 显示行号
set tabstop=4                   " 设定tab长度为4
set shiftwidth=4                " 缩进的空格数
set expandtab                 " 是否在缩进和遇到Tab键时使用空格代替; 使用noexpandtab取消设置
set autoindent                  " 自动缩进
set smartindent
set showmode			 "显示INSERT NORMAL等
set hlsearch
set incsearch
set showmatch                   " 显示括号配对情况

"undotree
nnoremap <F6> :UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile
set undolevels=1000
set undoreload=10000

set history=99                  " keep 99 lines of command history
set showmatch                   " 显示括号配对情况

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""vim scripts""""""""""""""""""
Bundle 'minibufexpl.vim'
Bundle 'winmanager'

""""""""git上的插件"""""""""""""""
 "自动补全
Bundle 'Valloric/YouCompleteMe'

Bundle 'scrooloose/syntastic'
 "漂亮的状态栏
Bundle 'Lokaltog/vim-powerline'
  "强大的文件搜索
Bundle 'kien/ctrlp.vim'
 "快速对齐
Bundle 'godlygeek/tabular'

Bundle 'vim-scripts/taglist.vim'
 "多光标编辑
Bundle 'terryma/vim-multiple-cursors'
 "自动高亮匹配标签
Bundle 'gregsexton/MatchTag'
 "强大的搜索定位
Bundle 'easymotion/vim-easymotion'
 "符号自动环绕
Bundle 'tpope/vim-surround'
 "内置了一堆语言的自动补全片段
"Bundle 'honza/vim-snippets'
 "文件树浏览
Bundle 'scrooloose/nerdtree'
 "ctags标签提取显示
Bundle 'majutsushi/tagbar'
 "显示对齐线的插件
Bundle 'Yggdroot/indentLine'
 "快速注释
Bundle 'scrooloose/nerdcommenter'
" undotree
Bundle 'mbbill/undotree'
""""""""themes"""""""""""""""
 "据说mac上的配色方案
Bundle 'tomasr/molokai'
Plugin 'crusoexia/vim-dracula'

call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

syntax enable
syntax on

set background=dark
"  主题设置
colorscheme dracula 

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=2
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapCTabSwitchWindows=0
let g:miniBufExplModSelTarget=1
let g:miniBufExplorerMoreThanOne=1

let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:AutoOpenWinManager = 1

"""""""""""""""""自动补全配置"""""""""""""
"离开插入模式自动关闭预览窗口
autocmd InsertLeave * if pumvisible()==0|pclose|endif  
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
"从第二个字符开始自动补全
let g:ycm_min_num_of_chars_for_completion = 1
"在注释中也能补全
let g:ycm_complete_in_comments = 1 
"在字符串中也能补全
let g:ycm_complete_in_strings = 1 
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1 
"开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1 
"fix_it
let g:ycm_echo_current_diagnostic=1

let mapleader = ","
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

noremap <leader>gi :YcmCompleter GoToInclude<CR>
noremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <F8> :YcmDiags<CR>

"""""""""""""""""多光标编辑
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_skip_key='<C-o>'
let g:multi_cursor_quit_key='<Esc>'

"自动搜索功能相关
"let g:EasyMotion_smartcase = 1
"map f <Plug>(easymotion-f)
"map F <Plug>(easymotion-F)
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)
"map <leader>. <Plug>(easymotion-repeat)

""""""""""""""""""""""搜索文件插件配置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'q'
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

noremap <f2> :NERDTreeFind<cr>
map <F9> :TagbarToggle<CR>
nnoremap <F4> :UndotreeToggle<cr>
"""""""""""""""""""文件标签
let g:Tagbar_title = "[Tagbar]"

function! Tagbar_Start()
"    exe 'q'
    exec 'TagbarOpen'
endfunction

function! Tagbar_IsValid()
    return 1
endfunction
let g:tagbar_vertical = 30
let g:tagbar_expand = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1


let g:indentLine_enabled = 1
let g:indentLine_fileType = ['c','cpp','python']

""""""""""""""""""""""""""""ctags 
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""""""""""""""""""""""""""""taglist
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 

"""""""""""""""""""""""""""""跳转相关Cscope

map g<C-]> :cs find 3 <C-R>=expand(“<cword>”)<CR><CR>
map g<C-/> :cs find 0 <C-R>=expand(“<cword>”)<CR><CR>

noremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
noremap <leader>f :cs find f <C-R>=expand("<cword>")<CR><CR>

nmap<C-_>s :cs find s<C-R>=expand("<cword>")<CR><CR>

nmap <C-_>g :cs find g<C-R>=expand("<cword>")<CR><CR>

nmap <C-_>c :cs find c<C-R>=expand("<cword>")<CR><CR>

nmap <C-_>t :cs find t<C-R>=expand("<cword>")<CR><CR>

nmap <C-_>e :cs find e<C-R>=expand("<cword>")<CR><CR>

nmap <C-_>f :cs find f<C-R>=expand("<cfile>")<CR><CR>

nmap <C-_>i :cs find i<C-R>=expand("<cfile>")<CR>$<CR>

nmap <C-_>d :cs find d<C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""自动注释
noremap  <silent> <C-C> :call NERDComment(1, "Sexy")<CR>
noremap  <silent> <C-X> :call NERDComment(1, "Uncomment")<CR>

"""""""""""""""""""""""""""""cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst 
    set mouse=a
    set nocsverb
" add any database in current directory                                                                                                                                           
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
    set cscopetag
endif
