"���������ó�Ӣ��
set nocompatible

let $LANG = 'en'  "set message language 
set langmenu=en   "set menu's language of gvim. no spaces beside '=' 

"source $VIMRUNTIME\vimrc_examplie.vim
" 1. ע��
    :vnoremap ci :s/^/\/\/<cr>
    :vnoremap cu :s/\/\//<cr>
    :nnoremap ci :s/^/\/\/<cr>
    :nnoremap cu :s/\/\//<cr>
" ����
syntax on
" �������
colorscheme desert

" ��ֹ���ɱ����ļ��ͽ����ļ�
set nobackup
set noswapfile

" ����utf-8�ı��룬���߱߿����float.vim�ļ��������ֱ������
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

" ����tab��Ϊ4���ո�
set ts=4
set expandtab

" ��ϵͳ�еļ������vim�����ճ�����ƹ���
set clipboard=unnamed

" ������ʾ�к� 
:set nu

" ��ʾʮ�ֽ�����
:set cursorline cursorcolumn

" ��������������С 
:set guifont=Courier_New:h16
" ��Ļ�������Ǳ���5��
set scrolloff=5

" �����vim��backspace����ɾ��������
set nocompatible
" ������backspace�Ĺ�����ʽ
set backspace=indent,eol,start

" ��vim���Ա�������java�ļ�
map <F5> :!javac %&&java %:r <CR>

""""""""""""""""""""""""""""""" vim-plug ����������ļ�""""""""""""""""""""""" 
call plug#begin('D:\Program Files\Vim\vim82\plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
"����java���Զ���ȫ�Ĳ��
Plug 'vim-scripts/javacomplete'

" ����markdown�﷨�Ĳ��
" ʹ�÷����ο�����  https://vimawesome.com/plugin/markdown-syntax
"Plug 'plasticboy/vim-markdown'  

" markdown��Ԥ��
"Plug 'suan/vim-instant-markdown'
"Plug 'jamshedvesuna/vim-markdown-preview'
"Plug 'iamcco/mathjax-support-for-mkdp'

" ��װ��coc����
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'neoclide/coc.nvim',{'do':'yarn install --frozen-lockfile'}

call plug#end() 
""""""""""""""""""""""""""""""""""""""vim-plug����""""""""""""""""""""""""""""""""""""""""

" ����NerdTree��������ô���
map <F3> :NERDTreeToggle<CR>

" ʹ��markdownPreviewer���������


let vim_markdown_preview_github=1



" javacomplement�������
setlocal omnifunc=javacomplete
autocmd Filetype java set omnifunc=javacomplete
autocmd Filetype java set completefunc=javacomplete
"inormap <buffer> <C_X><C_U> <C_X><C_U><C_P>
"inormap <buffer> <C_S_Space> <C_X><C_U><C_P>

"========== coc.nvim ������Ϣ==============
let g:coc_global_extensions = ['coc-json','coc-vimlsp']

" ���ļ��ڻ���������û�б�����
set hidden

" ======================amcoc/markdownԤ����������Ϣ===============
"let g:mkdp_path_to_chrome = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exee"
" ���� chrome �������·������������ chrome���������ִ�������������
" ��������˸ò���, g:mkdp_browserfunc ��������

"let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" vim �ص�����, ����ΪҪ�򿪵� url

"let g:mkdp_auto_start = 1
" ����Ϊ 1 �����ڴ� markdown �ļ���ʱ���Զ��������Ԥ����ֻ�ڴ�
" markdown �ļ���ʱ���һ��

"let g:mkdp_auto_open = 1
" ����Ϊ 1 �ڱ༭ markdown ��ʱ����Ԥ�������Ƿ��Ѿ��򿪣������Զ���Ԥ
" ������

"let g:mkdp_auto_close = 1
" ���л� buffer ��ʱ���Զ��ر�Ԥ�����ڣ�����Ϊ 0 �����л� buffer ��ʱ��
" �Զ��ر�Ԥ������

"let g:mkdp_refresh_slow = 0
" ����Ϊ 1 ��ֻ���ڱ����ļ������˳�����ģʽ��ʱ�����Ԥ����Ĭ��Ϊ 0��ʵʱ
" ����Ԥ��

"let g:mkdp_command_for_global = 0
" ����Ϊ 1 �������ļ�������ʹ�� markdownpreview ����Ԥ����Ĭ��ֻ�� markdown
" �ļ�����ʹ�ø�����

"let g:mkdp_open_to_the_world = 0
" ����Ϊ 1, ��ʹ�õ������е����������Ҳ�ܷ���Ԥ��ҳ��
" Ĭ��ֻ�������أ�127.0.0.1����������������ܷ���
"
" ��ͨģʽ
"nmap <silent> <F8> <plug>markdownpreview       
" ����ģʽ
"imap <silent> <F8> <plug>markdownpreview       
" ��ͨģʽ
"nmap <silent> <c-F8> <plug>stopmarkdownpreview   
" ����ģʽ
"imap <silent> <C-F8> <Plug>StopMarkdownPreview    

" ==============================markdownԤ����������Ϣend=========================================

" �رձ���
set nobackup
set nowritebackup

" ��Ӧʱ��
set updatetime=100 

" ��tab���Զ���ȫ��ʱ�������Ч
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" : 
      \ <SID>check_back_space() ? "\<TAB>" : 
      \ coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ʹ��ctrl�Ϳո���Զ���ȫ
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

" ���ò��ҵ�ǰ��һ������һ�������λ��
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" ����������庯�������������ͻ��߽ӿ����õ�λ��
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ������ʾ��ǰ���ͣ���ı������Ե�ǰ���е���ͬ�ı������и�����ʾ
autocmd CursorHold * silent call CocActionAsync('highlight')


"==========================================


" 2.�������
    " �����ļ��У�
    ":noremap gd <c-]>zz "��ת������"
    :nnoremap gc :vsc Build.Compile         "����"
    :nnoremap gb :vsc Build.BuildSolution   "build the solution" 
    :nnoremap gs :vsc Debug.StopDebugging   "��������"
    :nnoremap gr :vsc Debug.Start           "��ʼ����"

    ":vnoremap gq ==
    ":nnoremap <space> za "�۵�"
    :nnoremap zm :vsc VAssistX.ListMethodsInCurrentFile<cr> "�����б�"
    :nnoremap cj :vsc VAssistX.FindReferencesinFile<CR> "��ǰ�ļ��е�����"
    :nnoremap ca :vsc VAssistX.FindReferences<CR> "�鿴��������"
    :nnoremap cm :vsc File.OpenContainingFolder<CR> "�������ļ���"
    :nnoremap zj :vsc Edit.QuickInfo<CR> "�鿴���������ĵ�"
    :nnoremap zp :vsc VAssistX.RefactorImplementInterface<CR> "ʵ�ֽӿ�"

    "visualģʽ�еĲ���"
    :vnoremap * "/y/<C-r>/<CR>
    :vnoremap # "/y?<C-r>/<CR>

    :nnoremap <c-o> :vsc View.NavigateBackward<CR>  
    :nnoremap <c-i> :vsc View.NavigateForward<CR>

    "�򿪲鿴��ĶԻ���
    :nnoremap cs :vsc VAssistX.FindSymbolDialog<CR>

    "�򿪲鿴�ļ��ĶԻ���
    :nnoremap cf :vsc VAssistX.OpenFileInSolutionDialog<CR>

    "open VAOutline
    :nnoremap co :vsc VAssistX.VAOutline<CR>

    "�򿪽��������Դ������
    :nnoremap cv :vsc View.SolutionExplorer<CR>

    "���ļ��в���
    :nnoremap ck :vsc Edit.FindinFiles<CR>

" ӳ��shift+enter �����ڶ��м�Ҳ����ֱ���½�����һ��
:nmap <S-CR> o<Esc>
:inoremap <S-CR> <Esc>o<Esc>


" ��Ӹ�����Ϣ�Ѿ��༭ʱ��(�ļ�����ʱ��ͱ༭��)
:map <F2> ggi<CR><Esc>ggi"""<Esc>oDate:<Esc>:r!date/t<CR><Esc>ocoder:<Esc>obevishe<Esc>o"""<CR>

