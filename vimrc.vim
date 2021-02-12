if &cp
  se nocp
en

let $ZDOTDIR = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/home'
let s:data_dir = $ZDOTDIR . '/data'
let s:cache_dir = s:data_dir . '/vim/cache'
let &rtp = s:cache_dir . '/runtime,$VIMRUNTIME'
let &pp = &rtp
let s:vim_packager_repo_root = s:cache_dir . '/runtime/pack/packager/opt/vim-packager'
let s:zinit_repo_root = s:data_dir . '/zsh/cache/zinit/bin'
let &sh = system('which zsh | xargs printf')

if !isdirectory(s:vim_packager_repo_root)
  exe 'sil !git clone https://github.com/kristijanhusak/vim-packager.git ' . s:vim_packager_repo_root
en

if !isdirectory(s:zinit_repo_root)
  exe 'sil !git clone https://github.com/zdharma/zinit.git ' . s:zinit_repo_root
en

fu! s:packager_init(p) abort
  cal a:p.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  cal a:p.add('tpope/vim-sensible')
  cal a:p.add('lifepillar/vim-gruvbox8')
  cal a:p.add('vim-airline/vim-airline')
  cal a:p.add('tpope/vim-sleuth')
  cal a:p.add('jiangmiao/auto-pairs')
  cal a:p.add('lambdalisue/gina.vim')
  cal a:p.add('airblade/vim-gitgutter')
endf

pa vim-packager
cal packager#setup(function('s:packager_init'))

let g:airline_theme = 'gruvbox8'
se bg=dark
se tgc

try
  colo gruvbox8_hard
cat | endt
