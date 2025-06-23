" separate system clipboard from vim
set clipboard=

" prevent x from copying to clipboard
nnoremap x "_x

" make c+y function as y
nmap ^c y

" make syntax on all the time
syntax on

" Move by visual lines only if no count is given
nmap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <expr> k (v:count == 0 ? 'gk' : 'k')

" Set jump to end of the line visual
nmap $ g$
nmap 0 g0

" make the jump to very end/beginning of the file 
nmap gg gg0
nmap G G$

" Set relative line numbers
set number
set relativenumber
