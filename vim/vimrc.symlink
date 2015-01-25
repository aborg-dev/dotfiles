" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to " make changes after sourcing archlinux.vim since it alters the value of the " 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible
filetype off

filetype plugin indent on

set nu
set tabstop=4
set shiftwidth=4
set autoindent
set showmatch
set expandtab
set colorcolumn=100
syntax on
syntax enable
colorscheme slate
set background=dark

let g:solarized_termcolors=256
se t_Co=16

set fileencodings=utf-8,default,cp1251

noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

func CompileRunGcc()
	w
	!g++ -D_DEBUG -std=c++0x -O2 % -o %<
	!./%<
endfunc

func RunPython2()
  w
  !python2 %
endfunc

func RunPython3()
  w
  !python3 %
endfunc

func CompileRunTeX()
	w
  !pdflatex %
  !evince %<.pdf
endfunc

au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source ~/.vim/thrift.vim

au BufRead,BufNewFile *.ypp set filetype=yacc
au! Syntax yacc source /usr/share/vim/vim73/syntax/yacc.vim

cmap w!! %!sudo tee > /dev/null %

map <F5> :call CompileRunGcc() <CR>
map <F6> :call RunPython2() <CR>
map <F7> :call RunPython3() <CR>
map <F8> :call CompileRunTeX() <CR>

set wildmenu

set wcm=<Tab>

menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>

menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>

menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>

menu Encoding.utf-8 :e ++enc=utf8 <CR>

menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

map <F9> :emenu Encoding.<TAB>
