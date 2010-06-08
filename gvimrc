" Font
set guifont=EnvyCodeR:h12.00
set noantialias

" No audible bell
set vb

" No toolbar
set guioptions-=T
set guioptions-=r

" Use console dialogs
set guioptions+=c

hi normal guibg=black
set transp=8

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

