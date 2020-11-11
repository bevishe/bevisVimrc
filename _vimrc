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

" ��vim���Ա�������java�ļ�
map <F5> :!javac %&&java %:r <CR>

""""""""""""""""""""""""""""""" vim-plug ����������ļ�""""""""""""""""""""""" 
call plug#begin('D:\Program Files\Vim\vim82\plugged')

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
" ����java���Զ���ȫ�Ĳ��
Plug 'vim-scripts/javacomplete'

" ����markdown�﷨�Ĳ��
" ʹ�÷����ο�����  https://vimawesome.com/plugin/markdown-syntax
Plug 'plasticboy/vim-markdown'  

" markdown��Ԥ��
Plug 'suan/vim-instant-markdown'
"Plug 'jamshedvesuna/vim-markdown-preview'
"Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#install()},'for': ['markdown','vim-plug']}
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

call plug#end() 
""""""""""""""""""""""""""""""""""""""vim-plug����""""""""""""""""""""""""""""""""""""""""

" ����NerdTree��������ô���
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" ʹ��markdownPreviewer���������
let vim_markdown_preview_github=1

" javacomplement�������
setlocal omnifunc=javacomplete
autocmd Filetype java set omnifunc=javacomplete
autocmd Filetype java set completefunc=javacomplete
"inormap <buffer> <C_X><C_U> <C_X><C_U><C_P>
"inormap <buffer> <C_S_Space> <C_X><C_U><C_P>

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


