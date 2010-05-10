" Font
set guifont=EnvyCodeR:h12.00
set noantialias

" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

if &background == "dark"
  hi normal guibg=black
  set transp=8
endif

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

