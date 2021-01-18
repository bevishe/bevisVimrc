"将界面设置成英文
set nocompatible

let $LANG = 'en'  "set message language 
set langmenu=en   "set menu's language of gvim. no spaces beside '=' 

"source $VIMRUNTIME\vimrc_examplie.vim
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

" 设置utf-8的编码，否者边框的在float.vim文件里面会出现编码错误
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

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

" 解决了vim下backspace不能删除的问题
set nocompatible
" 设置了backspace的工作方式
set backspace=indent,eol,start

" 让vim可以编译运行java文件
map <F5> :!javac %&&java %:r <CR>

""""""""""""""""""""""""""""""" vim-plug 插件的配置文件""""""""""""""""""""""" 
call plug#begin('D:\Program Files\Vim\vim82\plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
"用于java中自动补全的插件
Plug 'vim-scripts/javacomplete'

" 用于markdown语法的插件
" 使用方法参考资料  https://vimawesome.com/plugin/markdown-syntax
"Plug 'plasticboy/vim-markdown'  

" markdown的预览
"Plug 'suan/vim-instant-markdown'
"Plug 'jamshedvesuna/vim-markdown-preview'
"Plug 'iamcco/mathjax-support-for-mkdp'

" 安装了coc配置
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'neoclide/coc.nvim',{'do':'yarn install --frozen-lockfile'}

call plug#end() 
""""""""""""""""""""""""""""""""""""""vim-plug结束""""""""""""""""""""""""""""""""""""""""

" 设置NerdTree插件的配置代码
map <F3> :NERDTreeToggle<CR>

" 使用markdownPreviewer插件的配置


let vim_markdown_preview_github=1



" javacomplement插件配置
setlocal omnifunc=javacomplete
autocmd Filetype java set omnifunc=javacomplete
autocmd Filetype java set completefunc=javacomplete
"inormap <buffer> <C_X><C_U> <C_X><C_U><C_P>
"inormap <buffer> <C_S_Space> <C_X><C_U><C_P>

"========== coc.nvim 配置信息==============
let g:coc_global_extensions = ['coc-json','coc-vimlsp']

" 有文件在缓冲区里面没有被保存
set hidden

" ======================amcoc/markdown预览的配置信息===============
"let g:mkdp_path_to_chrome = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exee"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略

"let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" vim 回调函数, 参数为要打开的 url

"let g:mkdp_auto_start = 1
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

"let g:mkdp_auto_open = 1
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

"let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

"let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

"let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 markdownpreview 进行预览，默认只有 markdown
" 文件可以使用改命令

"let g:mkdp_open_to_the_world = 0
" 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" 默认只监听本地（127.0.0.1），其他计算机不能访问
"
" 普通模式
"nmap <silent> <F8> <plug>markdownpreview       
" 插入模式
"imap <silent> <F8> <plug>markdownpreview       
" 普通模式
"nmap <silent> <c-F8> <plug>stopmarkdownpreview   
" 插入模式
"imap <silent> <C-F8> <Plug>StopMarkdownPreview    

" ==============================markdown预览的配置信息end=========================================

" 关闭备份
set nobackup
set nowritebackup

" 响应时间
set updatetime=100 

" 让tab在自动补全的时候可以生效
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" : 
      \ <SID>check_back_space() ? "\<TAB>" : 
      \ coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用ctrl和空格打开自动补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 配置查找当前上一个和下一个报错的位置
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 光标跳到定义函数或者数据类型或者接口引用的位置
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 高亮显示当前光标停到的变量，对当前所有的相同的变量进行高亮显示
autocmd CursorHold * silent call CocActionAsync('highlight')


"==========================================


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

" 映射shift+enter 可以在段中间也可以直接新建到下一行
:nmap <S-CR> o<Esc>
:inoremap <S-CR> <Esc>o<Esc>


" 添加个人信息已经编辑时间(文件创建时间和编辑人)
:map <F2> ggi<CR><Esc>ggi"""<Esc>oDate:<Esc>:r!date/t<CR><Esc>ocoder:<Esc>obevishe<Esc>o"""<CR>

