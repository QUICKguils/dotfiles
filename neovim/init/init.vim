"     _       _ __        _
"    (_)___  (_) /__   __(_)___ ___
"   / / __ \/ / __/ | / / / __ `__ \
"  / / / / / / /__| |/ / / / / / / /
" /_/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" Config file sourced at Neovim startup
" -------------------------------------

" General settings
cd /home/guil
se mouse=a mousem=popup
se clipboard=unnamedplus
se tabstop=4 softtabstop=4 shiftwidth=4
se smartindent
se noshowmode
se nu rnu
se nowrap textwidth=80 cc=81 formatoptions=cqj
se scrolloff=5
se nohls ignorecase smartcase
se list lcs=trail:•,tab:│\ ,extends:▶,precedes:◀
se spelllang=en_us,fr
se spellfile=/home/guil/.local/share/nvim/site/spell/LexiquePerso.utf-8.add

" Formatting, mappings and compilation by file type
source ~/.config/nvim/filetype.vim

" Mappings
source ~/.config/nvim/mappings.vim

" Colorscheme and gui-capabilities settings
source ~/.config/nvim/color-gui.vim

" Netrw settings (default file explorer)
let g:netrw_banner=0
let g:netrw_liststyle=1
let g:netrw_sort_by="name"
let g:netrw_sort_sequence="[\/],*,.\*$,\~$"
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

" Statusline config (lightline.vim)
source ~/.config/nvim/statusline.vim
