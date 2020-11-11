" 1. 注释
    :vnoremap ci :s/^/\/\/<cr>
    :vnoremap cu :s/\/\//<cr>
    :nnoremap ci :s/^/\/\/<cr>
    :nnoremap cu :s/\/\//<cr>
" 高亮
syntax on
" 主题高亮
colorscheme desert

" 禁止生成备份文件和交换文件
set nobackup
set noswapfile

" 设置tab键为4个空格
set ts=4
set expandtab

" 让系统中的剪贴板和vim里面的粘贴复制共享
set clipboard=unnamed

" 设置显示行号 
:set nu

" 显示十字交叉光标
:set cursorline cursorcolumn

" 设置字体和字体大小 
:set guifont=Courier_New:h16
" 屏幕顶部总是保留5行
set scrolloff=5

" 让vim可以编译运行java文件
map <F5> :!javac %&&java %:r <CR>

""""""""""""""""""""""""""""""" vim-plug 插件的配置文件""""""""""""""""""""""" 
call plug#begin('D:\Program Files\Vim\vim82\plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" 用于java中自动补全的插件
Plug 'vim-scripts/javacomplete'

" 用于markdown语法的插件
" 使用方法参考资料  https://vimawesome.com/plugin/markdown-syntax
Plug 'plasticboy/vim-markdown'  

" markdown的预览
Plug 'suan/vim-instant-markdown'
"Plug 'jamshedvesuna/vim-markdown-preview'
"Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#install()},'for': ['markdown','vim-plug']}
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

call plug#end() 
""""""""""""""""""""""""""""""""""""""vim-plug结束""""""""""""""""""""""""""""""""""""""""

" 设置NerdTree插件的配置代码
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" 使用markdownPreviewer插件的配置
let vim_markdown_preview_github=1

" javacomplement插件配置
setlocal omnifunc=javacomplete
autocmd Filetype java set omnifunc=javacomplete
autocmd Filetype java set completefunc=javacomplete
"inormap <buffer> <C_X><C_U> <C_X><C_U><C_P>
"inormap <buffer> <C_S_Space> <C_X><C_U><C_P>

" 2.相关配置
    " 单个文件中：
    ":noremap gd <c-]>zz "跳转到定义"
    :nnoremap gc :vsc Build.Compile         "编译"
    :nnoremap gb :vsc Build.BuildSolution   "build the solution" 
    :nnoremap gs :vsc Debug.StopDebugging   "结束调试"
    :nnoremap gr :vsc Debug.Start           "开始调试"

    ":vnoremap gq ==
    ":nnoremap <space> za "折叠"
    :nnoremap zm :vsc VAssistX.ListMethodsInCurrentFile<cr> "函数列表"
    :nnoremap cj :vsc VAssistX.FindReferencesinFile<CR> "当前文件中的引用"
    :nnoremap ca :vsc VAssistX.FindReferences<CR> "查看所有引用"
    :nnoremap cm :vsc File.OpenContainingFolder<CR> "打开所在文件夹"
    :nnoremap zj :vsc Edit.QuickInfo<CR> "查看函数定义文档"
    :nnoremap zp :vsc VAssistX.RefactorImplementInterface<CR> "实现接口"

    "visual模式中的查找"
    :vnoremap * "/y/<C-r>/<CR>
    :vnoremap # "/y?<C-r>/<CR>

    :nnoremap <c-o> :vsc View.NavigateBackward<CR>  
    :nnoremap <c-i> :vsc View.NavigateForward<CR>

    "打开查看类的对话框
    :nnoremap cs :vsc VAssistX.FindSymbolDialog<CR>

    "打开查看文件的对话框
    :nnoremap cf :vsc VAssistX.OpenFileInSolutionDialog<CR>

    "open VAOutline
    :nnoremap co :vsc VAssistX.VAOutline<CR>

    "打开解决方案资源管理器
    :nnoremap cv :vsc View.SolutionExplorer<CR>

    "在文件中查找
    :nnoremap ck :vsc Edit.FindinFiles<CR>


