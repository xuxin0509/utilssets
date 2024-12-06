scriptencoding utf-8

set encoding=utf-8                       " 编码设置
set nocompatible                         " 去除vi一致性
set runtimepath^=$VIM_PATH
set modelines=0                          " 禁用模式行（安全措施）
colorscheme evening

set number                               " 显示行号
"set relativenumber                       " 显示相对行号
set smartindent                          " 智能缩进
set autoindent                           " 自动对齐

set splitright                           " 设置左右分割窗口时，新窗口出现在右侧
set splitbelow                           " 设置水平分割窗口时，新窗口出现在底部

set nobackup                             " 不需要备份
"set noswapfile                           " 禁止生成临时文件
set autoread                             " 文件自动检测外部更改
set clipboard=unnamed                    " 共享剪切板

set ambiwidth=double                     " 解决中文标点显示的问题
set nowrap                               " 不自动折行
"set mouse=a                              " 使用鼠标
"set mousehide                            " 输入时隐藏光标
"set sidescroll=10                        " 移动到看不见的字符时，自动向右滚动是个字符

set sm!                                  " 高亮显示匹配括号
set hlsearch                             " 高亮查找匹配
set ignorecase smartcase  " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set wrapscan              " 搜索到文件两端时重新搜索
set incsearch             " 输入搜索内容时就显示搜索结果
"set cursorline                           " 高亮显示当前行

set showmatch                            " 显示匹配
set ruler                                " 显示标尺，在右下角显示光标位置
set novisualbell                         " 不要闪烁
set showcmd                              " 显示输入的命令

set fileformat=unix      " e ++f=unix %
set fileformats=unix
set cc=80                " vim7.3默认提供了colorcolumn，即在第80列显示红色宽度线, cuc 表示将当前光标下的列高亮
set updatetime=1000      " 设定更新.swp 文件时间，milliseconds，此值影响taglist插件更新快慢
set smarttab
set shiftwidth=4         " 设定 << 和 >> 命令移动时的宽度为 4, code auto indent width
set softtabstop=4        " 使得按退格键时可以一次删掉 4 个空格
set tabstop=8            " 设定 tab 长度为 4
set number               " 显示行号
set showmatch            " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2          " 短暂跳转到匹配括号的时间
set matchpairs+=<:>      " Characters that form pairs

set laststatus=2                         " always show statusline
"set showtabline=2                        " always show tabline
set vb t_vb=

" 设置代码折叠---------------------------------
"  set nofoldenable             " 启动 vim 时关闭折叠代码
"  set foldmethod=indent        " 设置语法折叠
"  setlocal foldlevel=99        " 设置折叠层数
"  nnoremap <space> za          " 用空格键来开关折叠

" 设置光标样式-------------------------------
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set backspace=indent,eol,start           " 允许用退格键删除字符
set guifont=Hack_Nerd_Font_Mono:h16      " 设置字体和字体大小, 只对gui客户端起作用，终端使用需要修改终端字体和大小
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

set wildmenu              " vim 自身命令行模式智能补全
set autoindent
set smartindent
set cindent                      " c 语言语法缩进，good
" C/C++ indent options, help cinoptions-values
set cinoptions=(0,W8,U0,:0,g0,l1,t0,N-4,E-4

set list                  " 显示不可视字符 , 如tab符号，行结尾符号 ， nolist 不显示
" [ 二合字母：显示行尾的空格，:help dig
set listchars=trail:~

set listchars+=tab:>-  " [二合字母：crtl+k  14]    +: append listchars setting， tab will be showed as >----

set laststatus=2       " 显示状态栏 (默认值为 1, 无法显示状态栏), 设为1则窗口数多于一个的时候
                       " 显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
syntax on            " 自动语法高亮，会覆盖已有的颜色
syntax enable        " 打开语法的颜色显示 (turn on syntax color) , 只会设置没有设置过的组

filetype on          " 开启文件类型侦测
filetype plugin on   " 根据侦测到的不同类型加载对应的插件
filetype plugin indent on
" 将指定文件类型，空格自动转换为tab，手动使用以下命令
" :set expandtab
" :retab     ** command mode
autocmd FileType h,c,cpp,cxx,cc,java,sh,py,kt setlocal expandtab
autocmd BufNewFile,BufRead *.py let g:indentLine_enabled=1 " for indentLine

" filetype plugin on, then turns on omni completion
set completeopt=preview,menu

function! WindowNumber()
    let num=tabpagewinnr(tabpagenr())
        return num
endfunction
set statusline=%<%F%M%r\ [%{&fileformat}][%{&fileencoding?&fileencoding:&encoding}]%=\ %l:%c\ %p%%\ win:%{WindowNumber()}
" 设置状态行-----------------------------------
" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型

"hi User1 cterm=none ctermfg=gray ctermbg=darkgray
"hi User2 cterm=none ctermfg=darkgrey ctermbg=gray
"hi User3 cterm=bold ctermfg=darkgrey ctermbg=gray
"hi User4 cterm=bold ctermfg=yellow ctermbg=gray
"hi User5 cterm=none ctermfg=darkgrey ctermbg=gray
"hi User6 cterm=none ctermfg=darkgrey ctermbg=gray

" 设置tab栏-------------------------------------------------
" 选中的tab颜色
hi SelectTabLine term=Bold cterm=Bold ctermfg=DarkYellow ctermbg=LightGray
hi SelectPageNum cterm=None ctermfg=DarkRed ctermbg=LightGray
hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=LightGray
" 未选中状态的tab
hi NormalTabLine cterm=None ctermfg=Gray ctermbg=DarkGray
hi NormalPageNum cterm=None ctermfg=Gray ctermbg=DarkGray
hi NormalWindowsNum cterm=None ctermfg=Gray ctermbg=DarkGray
" tab栏背景色
hi TabLineFill term=reverse ctermfg=5 ctermbg=7 guibg=#6c6c6c

let g:markdown_fenced_languages =['c', 'cpp', 'python', 'javascript']
" 设置netrw-------------------------------------
let g:netrw_banner = 0         " 设置是否显示横幅
let g:netrw_liststyle = 3      " 设置目录列表样式：树形
let g:netrw_browse_split = 4   " 在之前的窗口编辑文件
let g:netrw_altv = 1           " 水平分割时，文件浏览器始终显示在左边
let g:netrw_winsize = 20       " 设置文件浏览器窗口宽度为25%
let g:netrw_list_hide= '^\..*' " 不显示隐藏文件 用 a 键就可以显示所有文件、 隐藏匹配文件或只显示匹配文件

" set netrw maxium number of modified directories to 0
let g:netrw_dirhistmax = 0
" set current history count of modified directories to 0
let g:netrw_dirhist_cnt = 0
" tagbar
let g:tagbar_left = 1
let g:tagbar_foldlevel = 1
let g:tagbar_sort = 0
let g:tagbar_width = 30

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    " set csverb  " output verbose message and wait enter key
    set cspc=10
    set nocscopeverbose
    if filereadable("cscope.out")    "add any database in current dir
        cs add cscope.out . -C
    else    "else search cscope.out elsewhere
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)        "echo cscope_file
            exe "cs add" cscope_file cscope_pre "-C"
        endif
    endif
endif

if filereadable("tags") "add any database in current dir
    set tags=tags
else "else search tags elsewhere
    let tags_file=findfile("tags", ".;")
    if !empty(tags_file) && filereadable(tags_file)
        exe "set tags=" . tags_file
    endif
endif

autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	" 回车即选中当前项
" 快捷键绑定-------------------------
let mapleader='\'
" 设置转到定义处的快捷键
"nnoremap  <c-]>  g<c-]>      " 键值映射  ctrl+]  映射为  g+ctrl+]
nnoremap <LEADER>ft :Lexplore<CR>    " 打开或关闭目录树
nnoremap <F2> :Tagbar<CR><esc><c-w>=  " trigger and make all windows equally high and wide
nnoremap <F4> :close<CR>     " 多个窗口时，快速关闭当前窗口

" plugins installed by vim-plug
" PlugInstall command
call plug#begin()
Plug 'aklt/plantuml-syntax'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS syntax support
Plug 'groenewege/vim-less', { 'for': 'css' } " LESS support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript syntax support
Plug 'nathanaelkane/vim-indent-guides', { 'for': [ 'c', 'cpp', 'java', 'css', 'javascript' ] } " visually displaying indent levels
Plug 'Yggdroot/indentLine', { 'for': 'python' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'will133/vim-dirdiff'
Plug 'udalov/kotlin-vim'
call plug#end()

" for kotlin
let g:tagbar_type_kotlin = {
    \ 'ctagstype' : 'kotlin',
    \ 'ctagsbin' : '$ENV_PATH/bin/ctags',
    \ 'kinds'     : [
        \ 'c:classes:0:1',
        \ 'f:functions',
        \ 'g:enums',
        \ 'u:unions',
        \ 's:structs',
        \ 'm:members'
    \ ],
    \'sro': '.',
    \ 'kind2scope' : {
        \ 'c' : 'class',
        \ 'g' : 'enum',
        \ 's' : 'struct',
        \ 'u' : 'union'
    \},
    \ 'scope2kind' : {
        \ 'enum'      : 'g',
        \ 'class'     : 'c',
        \ 'struct'    : 's',
        \ 'union'     : 'u'
    \ }
\ }
