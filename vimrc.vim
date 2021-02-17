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
  cal a:p.add('editorconfig/editorconfig-vim')
  cal a:p.add('jiangmiao/auto-pairs')
  cal a:p.add('tpope/vim-rsi')
  cal a:p.add('lambdalisue/gina.vim')
  cal a:p.add('airblade/vim-gitgutter')
  cal a:p.add('907th/vim-auto-save')
  cal a:p.add('mattn/vim-lsp-settings', { 'requires': 'prabirshrestha/vim-lsp' })
  cal a:p.add('prabirshrestha/asyncomplete-lsp.vim', { 'requires': 'prabirshrestha/asyncomplete.vim' })
  cal a:p.add('hrsh7th/vim-vsnip-integ', { 'requires': 'hrsh7th/vim-vsnip' })
  cal a:p.add('liuchengxu/vim-which-key')
  cal a:p.add('mbbill/undotree')
  cal a:p.add('liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } })
  cal a:p.add('simeji/winresizer')
  cal a:p.add('voldikss/vim-floaterm')
  cal a:p.add('vimwiki/vimwiki')
endf

pa vim-packager
cal packager#setup(function('s:packager_init'))

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme = 'gruvbox8'
let g:floaterm_autoclose = 2
let g:floaterm_keymap_first = '<leader>pff'
let g:floaterm_keymap_hide = '<leader>pfh'
let g:floaterm_keymap_kill = '<leader>pfk'
let g:floaterm_keymap_last = '<leader>pfl'
let g:floaterm_keymap_new = '<leader>pfN'
let g:floaterm_keymap_next = '<leader>pfn'
let g:floaterm_keymap_prev = '<leader>pfp'
let g:floaterm_keymap_show = '<leader>pfs'
let g:floaterm_keymap_toggle = '<leader>pft'
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
let g:which_key_map.p.c.P = { 'name': '+plugin' }
let g:which_key_map.p.c.P.f = 'floaterm'
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
let g:which_key_map.p.f = { 'name': '+floaterm' }
let g:which_key_map.p.f.N = 'new'
let g:which_key_map.p.f.f = 'switch to first'
let g:which_key_map.p.f.h = 'hide'
let g:which_key_map.p.f.k = 'kill'
let g:which_key_map.p.f.l = 'switch to last'
let g:which_key_map.p.f.n = 'switch to next'
let g:which_key_map.p.f.p = 'switch to previous'
let g:which_key_map.p.f.s = 'show'
let g:which_key_map.p.f.t = 'toggle'
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
se mouse=a
se nu
se rnu
se swf
se tgc
se udf

try
  colo gruvbox8_hard
cat | endt

nn <silent><c-k>" :bel ter ++close<CR>
nn <silent><c-k>% :vert bel ter ++close<CR>
nn <silent><c-k>1 :1tabn<CR>
nn <silent><c-k>2 :2tabn<CR>
nn <silent><c-k>3 :3tabn<CR>
nn <silent><c-k>4 :4tabn<CR>
nn <silent><c-k>5 :5tabn<CR>
nn <silent><c-k>6 :6tabn<CR>
nn <silent><c-k>7 :7tabn<CR>
nn <silent><c-k>8 :8tabn<CR>
nn <silent><c-k>9 :9tabn<CR>
nn <silent><c-k><Down> <c-w><Down>
nn <silent><c-k><Left> <c-w><Left>
nn <silent><c-k><Right> <c-w><Right>
nn <silent><c-k><Up> <c-w><Up>
nn <silent><c-k><c-k> <c-k>
nn <silent><c-k>c :$tab ter ++close<CR>
nn <silent><c-k>n <c-w>:tabn<CR>
nn <silent><c-k>o <c-w><c-w>
nn <silent><c-k>p <c-w>:tabp<CR>
nn <silent><c-k>x :q!<CR>
nn <silent><leader> :<c-u>WhichKey '<Bslash>'<CR>
nn <silent><leader>pcBc :Clap bcommits<CR>
nn <silent><leader>pcBl :Clap blines<CR>
nn <silent><leader>pcCc :Clap command<CR>
nn <silent><leader>pcCh :Clap command_history<CR>
nn <silent><leader>pcGd :Clap git_diff_files<CR>
nn <silent><leader>pcGf :Clap gfiles<CR>
nn <silent><leader>pcPf :Clap floaterm<CR>
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
nn <silent><leader>pfN :FloatermNew<CR>
nn <silent><leader>pff :FloatermFirst<CR>
nn <silent><leader>pfh :FloatermHide<CR>
nn <silent><leader>pfk :FloatermKill<CR>
nn <silent><leader>pfl :FloatermLast<CR>
nn <silent><leader>pfn :FloatermNext<CR>
nn <silent><leader>pfp :FloatermPrev<CR>
nn <silent><leader>pfs :FloatermShow<CR>
nn <silent><leader>pft :FloatermToggle<CR>
nn <silent><leader>puf :UndotreeFocus<CR>
nn <silent><leader>puh :UndotreeHide<CR>
nn <silent><leader>pus :UndotreeShow<CR>
nn <silent><leader>put :UndotreeToggle<CR>
tno <silent><c-k>" <c-w>:bel ter ++close<CR>
tno <silent><c-k>% <c-w>:vert bel ter ++close<CR>
tno <silent><c-k>1 <c-w>:1tabn<CR>
tno <silent><c-k>2 <c-w>:2tabn<CR>
tno <silent><c-k>3 <c-w>:3tabn<CR>
tno <silent><c-k>4 <c-w>:4tabn<CR>
tno <silent><c-k>5 <c-w>:5tabn<CR>
tno <silent><c-k>6 <c-w>:6tabn<CR>
tno <silent><c-k>7 <c-w>:7tabn<CR>
tno <silent><c-k>8 <c-w>:8tabn<CR>
tno <silent><c-k>9 <c-w>:9tabn<CR>
tno <silent><c-k>: <c-w>:
tno <silent><c-k><Down> <c-w><Down>
tno <silent><c-k><Left> <c-w><Left>
tno <silent><c-k><Right> <c-w><Right>
tno <silent><c-k><Up> <c-w><Up>
tno <silent><c-k><c-k> <c-k>
tno <silent><c-k>c <c-w>:$tab ter ++close<CR>
tno <silent><c-k>n <c-w>:tabn<CR>
tno <silent><c-k>o <c-w><c-w>
tno <silent><c-k>p <c-w>:tabp<CR>
tno <silent><c-k>x <c-w>:q!<CR>
vn <silent><leader> :<c-u>WhichKeyVisual '<Bslash>'<CR>

com G Gina status
com Gc Gina commit

aug vimrc
  au!
  au VimEnter * cal which_key#register("\<Bslash>", 'g:which_key_map')
aug END
