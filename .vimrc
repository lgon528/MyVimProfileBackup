"==================================
"    Vim基本配置
"===================================

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
set cursorline
set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on


"设置搜索时忽略大小写
set ignorecase
"设置高亮搜索结果
set hlsearch
"设置增量搜索
set incsearch

"当文件在外部被修改后，自动重新读取
set autoread

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
"set mouse=a

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on


"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个tab
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"将;设置为命令前缀
let mapleader=";"

"映射切换tab的键位
nnoremap tj gT
nnoremap tk gt

"vundle相关配置
"{

    "开始使用Vundle的必须配置
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    "使用Vundle来管理Vundle
    Plugin 'gmarik/vundle'

    "VIM主题配色方案
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tomasr/molokai'
        "指定配色方案为256色
        set t_Co=256
        let g:solarized_termcolors=256
        set background=dark
        colorscheme solarized
        "colorscheme molokai
    
    "powerline fonts需要手动安装，在airline中使用powerline的箭头符号
    "对于ubuntu 16.04, 如果安装后还是有问题的话，可以试着移除以下文件：/etc/fonts/conf.d/70-no-bitmaps.conf
    Plugin 'powerline/fonts'
    "状态栏airline
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline_powerline_fonts=1
        let g:airline_detect_modified=1
        let g:airline_theme='dark'

        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#tabline#buffer_nr_show = 1
        
        let g:airline#extensions#syntastic#enabled = 1

        let g:airline#extensions#tagbar#enabled = 1
        let g:airline#extensions#tagbar#flags = 'f'

        let g:airline#extensions#whitespace#enabled = 0

    "C++语法高亮支持
    Plugin 'Mizuchi/STL-Syntax'

    "头文件与源文件切换
    Plugin 'a.vim'
        "*.cpp 和 *.h 间切换
        nnoremap <Leader>ch :A<CR>
        "子窗口中显示 *.cpp 或 *.h
        nnoremap <Leader>sch :AS<CR>

    "tagbar
    Plugin 'majutsushi/tagbar'
        let g:tagbar_left=1
        let g:tagbar_autofocus=1
        let g:tagbar_autoclose=1
        nnoremap <Leader>fj :TagbarToggle<CR>

   "让vim自动更新ctags
    Plugin 'DfrankUtil'
    Plugin 'vimprj'
    Plugin 'indexer.tar.gz'
        "设置插件 indexer 调用 ctags 的参数
        "默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
        "默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
        let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

    "代码搜索
    Plugin 'dyng/ctrlsf.vim'
        "依赖于系统的ack工具，需要先在系统中安装ack
        let g:ctrlsf_auto_close = 0
        let g:ctrlsf_winsize = 'auto'
        let g:ctrlsf_default_root = 'project'
        let g:ctrlsf_ignore_dir = ['build', 'doc', 'java', 'c_include', 'libs', 'net', 'obj', 'third_party', 'tool']
        nnoremap <Leader>sf :CtrlSF<CR>

    "快速代码注释
    Plugin 'scrooloose/nerdcommenter'

    "代码自动补全
    "1. 需要安装python2.6以上，及python-dev
    "2. 参考这个安装指引进行安装 https://github.com/lgon528/use_vim_as_ide#5.4.2 
    Plugin 'Valloric/YouCompleteMe'
        "指定全局.ycm_extra_conf.py
        "let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
        "YCM 补全菜单配色
        "菜单
        highlight Pmenu cterm=bold ctermfg=255 ctermbg=32 guifg=#ffffff guibg=#EEE8D5
        "选中项
        highlight PmenuSel cterm=bold ctermfg=64 ctermbg=190 guifg=#AFD700 guibg=#106900
        "补全功能在注释中同样有效
        let g:ycm_complete_in_comments=1
        "允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
        let g:ycm_confirm_extra_conf=0
        "开启 YCM 标签补全引擎
        let g:ycm_collect_identifiers_from_tags_files=1
        "从第一个键入字符就开始罗列匹配项
        let g:ycm_min_num_of_chars_for_completion=1
        "禁止缓存匹配项，每次都重新生成匹配项
        let g:ycm_cache_omnifunc=0
        "语法关键字补全         
        "let g:ycm_seed_identifiers_with_syntax=1
        "自动产生diagnostic list
        let g:ycm_always_populate_location_list=1
        "错误、警告符号
        let g:ycm_error_symbol='>>'
        let g:ycm_warning_symbol='>*'
        "YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
        inoremap <leader>; <C-x><C-o>
        "强制重新代码检查，可能会使得vim卡住
        nnoremap <F5> :YcmForceCompileAndDiagnostics<CR><CR>:lopen<CR>
        "引入 C++ 标准库tags
        "run cmd in directory 
        "ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
        set tags+=/usr/include/c++/5/stdcpp.tags
        "补全内容不以分割子窗口形式出现，只显示补全列表
        set completeopt-=preview

        
    "这里ycm已经包含了syntastic相关的功能，这里不使用syntastic
    "syntastic
    "Plugin 'scrooloose/syntastic'
        "set statusline+=%#warningmsg#
        "set statusline+=%{SyntasticStatuslineFlag()}
        "set statusline+=%*

        "let g:syntastic_always_populate_loc_list = 1
        "let g:syntastic_auto_loc_list = 1
        "let g:syntastic_check_on_open = 0
        "let g:syntastic_check_on_wq = 0

 

    "Vundle配置必须 开启插件
    filetype plugin indent on

"}

