
" echo $MYVIMRC
" source $MYVIMRC

set enc=utf-8
set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16
set fenc=utf-8
set shortmess=atI

call plug#begin()
Plug 'luochen1990/rainbow'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'lervag/vimtex'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rdnetto/YCM-Generator'
Plug 'nsf/gocode'
Plug 'tpope/vim-fireplace'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-unimpaired'
Plug 'yggdroot/leaderf'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'tbastos/vim-lua'
Plug 'sickill/vim-monokai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'bronson/vim-trailing-whitespace'
Plug 'tikhomirov/vim-glsl'
Plug 'moll/vim-node'
Plug 'vhdirk/vim-cmake'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'chiel92/vim-autoformat'
call plug#end()

"nerdTree 相关配置
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}



" ctags 相关配置
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif




" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>




let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

" 跳转快捷键
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
" 停止提示是否载入本地ycm_extra_conf文件
"let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 让补全行为与一般的IDE一致
set completeopt=longest,menu

" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 主动补全, 默认为<C-Space>
"let g:ycm_key_invoke_completion = ['<C-Space>']
" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
"let g:ycm_key_list_stop_completion = ['<C-y>']

noremap <F3> :Autoformat<CR> 



let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}









set number

" 不与 Vi 兼容（采用 Vim 自己的操作命令）
set nocompatible

" 字体
 if has('gui_running')
    if has("win16") || has("win32") || has("win95") || has("win64")
        set guifont=Sarasa_Mono_SC:h12
    else
        set guifont=Sarasa\ Mono\ SC\ 12
    endif
endif

colorscheme monokai

" 长度超过80的行标记
"highlight OverLength ctermbg=red ctermfg=white guibg=#ff0000 guifg=#005500
"match OverLength /\%81v.\+/
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey ctermfg=black guifg=black
"set colorcolumn=81

" 在状态栏显示正在输入的命令
set showcmd

set mouse=a

" 启用256色
set t_Co=256

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4

" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数。
set shiftwidth=4

" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
set expandtab

set softtabstop=4

" 光标所在的当前行高亮。
set cursorline

" 关闭自动折行
set nowrap

" 在状态栏显示光标的当前位置（位于哪一行哪一列）。
set  ruler

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号。
set showmatch

" 搜索时，高亮显示匹配结果。
set hlsearch

set history=1000

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。
set autoread

" 搜索设置
set ignorecase
set incsearch

" 复制粘贴设置,使用系统剪切板
" set clipboard=unnamed

" 开启语法高亮
syntax on

" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline

"可随时用倒退键删除
set backspace=2



" 一直显示status line
"set laststatus=2
"
"set statusline=
""set statusline +=%F            "full path
""set statusline +=%L            "total lines
"
"" mode 颜色
"hi NormalColor guifg=Black guibg=grey ctermbg=grey ctermfg=0
"hi InsertColor guifg=Black guibg=red ctermbg=red ctermfg=0
"hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=165 ctermfg=0
"hi VisualColor guifg=Black guibg=yellow ctermbg=yellow ctermfg=0
"set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ N\ ':''}
"set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ I\ ':''}
"set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ R\ ':''}
"set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ V\ ':''}
"set statusline+=%#PmenuSel#
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\ 
