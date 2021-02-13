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

let s:bdir = s:cache_dir . '/backups'
let s:dir = s:cache_dir . '/swapfiles'
let s:udir = s:cache_dir . '/undofiles'

if !isdirectory(s:vim_packager_repo_root)
  exe 'sil !git clone https://github.com/kristijanhusak/vim-packager.git ' . s:vim_packager_repo_root
en

if !isdirectory(s:zinit_repo_root)
  exe 'sil !git clone https://github.com/zdharma/zinit.git ' . s:zinit_repo_root
en

if !isdirectory(s:bdir)
  cal mkdir(s:bdir)
en

if !isdirectory(s:dir)
  cal mkdir(s:dir)
en

if !isdirectory(s:udir)
  cal mkdir(s:udir)
en

let &bdir = s:cache_dir . '/backups'
let &dir = s:cache_dir . '/swapfiles'
let &udir = s:cache_dir . '/undofiles'
let &vi = s:cache_dir . '/viminfo'

fu! s:packager_init(p) abort
  cal a:p.add('kristijanhusak/vim-packager', { 'type': 'opt' })
  cal a:p.add('tpope/vim-sensible')
  cal a:p.add('lifepillar/vim-gruvbox8')
  cal a:p.add('vim-airline/vim-airline')
  cal a:p.add('tpope/vim-sleuth')
  cal a:p.add('jiangmiao/auto-pairs')
  cal a:p.add('lambdalisue/gina.vim')
  cal a:p.add('airblade/vim-gitgutter')
  cal a:p.add('mattn/vim-lsp-settings', { 'requires': 'prabirshrestha/vim-lsp' })
  cal a:p.add('prabirshrestha/asyncomplete-lsp.vim', { 'requires': 'prabirshrestha/asyncomplete.vim' })
  cal a:p.add('hrsh7th/vim-vsnip-integ', { 'requires': 'hrsh7th/vim-vsnip' })
  cal a:p.add('liuchengxu/vim-which-key')
  cal a:p.add('mbbill/undotree')
  cal a:p.add('liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } })
  cal a:p.add('simeji/winresizer')
endf

pa vim-packager
cal packager#setup(function('s:packager_init'))

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox8'
let g:lsp_settings_servers_dir = s:cache_dir . '/vim-lsp-settings/servers'
let g:which_key_map = {}
let g:which_key_map.p = { 'name': '+plugin' }
let g:which_key_map.p.c = { 'name': '+clap' }
let g:which_key_map.p.c.B = { 'name': '+buffer' }
let g:which_key_map.p.c.B.c = 'commits'
let g:which_key_map.p.c.B.l = 'lines'
let g:which_key_map.p.c.C = { 'name': '+command' }
let g:which_key_map.p.c.C.c = 'command'
let g:which_key_map.p.c.C.h = 'command history'
let g:which_key_map.p.c.G = { 'name': '+git' }
let g:which_key_map.p.c.G.d = 'diff files'
let g:which_key_map.p.c.G.f = 'files'
let g:which_key_map.p.c.b = 'buffers'
let g:which_key_map.p.c.c = 'commits'
let g:which_key_map.p.c.f = 'files'
let g:which_key_map.p.c.h = 'history'
let g:which_key_map.p.c.j = 'jumps'
let g:which_key_map.p.c.l = 'lines'
let g:which_key_map.p.c.p = 'providers'
let g:which_key_map.p.c.q = 'quickfix'
let g:which_key_map.p.c.r = 'registers'
let g:which_key_map.p.c.s = 'search history'
let g:which_key_map.p.c.w = 'windows'
let g:which_key_map.p.c.y = 'yanks'
let g:which_key_map.p.u = { 'name': '+undotree' }
let g:which_key_map.p.u.f = 'focus'
let g:which_key_map.p.u.h = 'hide'
let g:which_key_map.p.u.s = 'show'
let g:which_key_map.p.u.t = 'toggle'
let g:which_key_map.p.w = 'winresizer'
let g:winresizer_start_key = '<Bslash>pw'
se bg=dark
se bk
se cul
se nu
se rnu
se swf
se tgc
se udf

try
  colo gruvbox8_hard
cat | endt

nn <silent><leader> :<c-u>WhichKey '<Bslash>'<CR>
nn <silent><leader>pcBc :Clap bcommits<CR>
nn <silent><leader>pcBl :Clap blines<CR>
nn <silent><leader>pcCc :Clap command<CR>
nn <silent><leader>pcCh :Clap command_history<CR>
nn <silent><leader>pcGd :Clap git_diff_files<CR>
nn <silent><leader>pcGf :Clap gfiles<CR>
nn <silent><leader>pcb :Clap buffers<CR>
nn <silent><leader>pcc :Clap commits<CR>
nn <silent><leader>pcf :Clap files<CR>
nn <silent><leader>pch :Clap history<CR>
nn <silent><leader>pcj :Clap jumps<CR>
nn <silent><leader>pcl :Clap lines<CR>
nn <silent><leader>pcp :Clap providers<CR>
nn <silent><leader>pcq :Clap quickfix<CR>
nn <silent><leader>pcr :Clap registers<CR>
nn <silent><leader>pcs :Clap search_history<CR>
nn <silent><leader>pcw :Clap windows<CR>
nn <silent><leader>pcy :Clap yanks<CR>
nn <silent><leader>puf :UndotreeFocus<CR>
nn <silent><leader>puh :UndotreeHide<CR>
nn <silent><leader>pus :UndotreeShow<CR>
nn <silent><leader>put :UndotreeToggle<CR>
vn <silent><leader> :<c-u>WhichKeyVisual '<Bslash>'<CR>

aug vimrc
  au!
  au VimEnter * cal which_key#register("\<Bslash>", 'g:which_key_map')
aug END
