data_dir="${ZDOTDIR}/data"
cache_dir="${data_dir}/zsh/cache"
declare -A ZINIT=(
  [BIN_DIR]="${cache_dir}/zinit/bin"
  [COMPLETIONS_DIR]="${cache_dir}/zinit/completions"
  [HOME_DIR]="${cache_dir}/zinit"
  [PLUGINS_DIR]="${cache_dir}/zinit/plugins"
  [SNIPPETS_DIR]="${cache_dir}/snippets"
  [ZCOMPDUMP_PATH]="${ZDOTDIR}/.zcompdump"
)
ZPFX="${cache_dir}/zinit/polaris"

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
HISTFILE="${cache_dir}/zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000

export ASDF_DIR="${ZINIT[PLUGINS_DIR]}/asdf-vm---asdf"
export ASDF_DATA_DIR="${ZINIT[PLUGINS_DIR]}/asdf-vm---asdf"
export GHQ_ROOT="${data_dir}/ghq"
export N_PREFIX="${data_dir}/opt/n"
export PATH="${N_PREFIX}/bin:${PATH}"

function expand_os {
  case "$1" in
    'GNU/Linux' )
      printf gnu
      ;;
    * )
      printf '%s' "$1"
      ;;
  esac
}

. "${ZINIT[BIN_DIR]}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice as'program' ver'v0.8.0' src'asdf.sh'; zinit light asdf-vm/asdf
zinit ice as'program' make"PREFIX=\"${ZPFX}\""; zinit light tj/n
zinit light olets/zsh-abbr
zinit ice as'program' make"install PREFIX=\"${ZPFX}\""; zinit light aristocratos/bashtop
zinit ice from'gh-r' as'program' bpick"*$(expand_os "$(uname -o)")*"; zinit load XAMPPRocky/tokei
zinit ice from'gh-r' as'program' mv'bat* -> bat' pick'bat/bat'; zinit load sharkdp/bat
zinit ice from'gh-r' as'program' mv'browsh* -> browsh'; zinit load browsh-org/browsh
zinit ice from'gh-r' as'program' mv'delta* -> delta' pick'delta/delta'; zinit load dandavison/delta
zinit ice from'gh-r' as'program' mv'fd* -> fd' pick'fd/fd'; zinit load sharkdp/fd
zinit ice from'gh-r' as'program' mv'gh* -> gh' pick'gh/bin/gh' bpick'*.tar.gz'; zinit load cli/cli
zinit ice from'gh-r' as'program' mv'ghq* -> ghq' pick'ghq/ghq'; zinit load x-motemen/ghq
zinit ice from'gh-r' as'program' mv'hub* -> hub' pick'hub/bin/hub'; zinit load github/hub
zinit ice from'gh-r' as'program' mv'hyperfine* -> hyperfine' pick'hyperfine/hyperfine'; zinit load sharkdp/hyperfine
zinit ice from'gh-r' as'program' mv'lsd* -> lsd' pick'lsd/lsd'; zinit load Peltoche/lsd
zinit ice from'gh-r' as'program' mv'pastel* -> pastel' pick'pastel/pastel'; zinit load sharkdp/pastel
zinit ice from'gh-r' as'program' mv'rclone* -> rclone' pick'rclone/rclone' bpick'*.zip'; zinit load rclone/rclone
zinit ice from'gh-r' as'program' mv'ripgrep* -> ripgrep' pick'ripgrep/rg'; zinit load BurntSushi/ripgrep
zinit ice from'gh-r' as'program' pick"build/$(uname -m)*/broot"; zinit load Canop/broot
zinit ice from'gh-r' as'program'; zinit load Rigellute/spotify-tui
zinit ice from'gh-r' as'program'; zinit load extrawurst/gitui
zinit ice from'gh-r' as'program'; zinit load lotabout/skim
zinit ice from'gh-r' as'program'; zinit load o2sh/onefetch

if type broot >/dev/null 2>&1; then
  eval "$(broot --print-shell-function zsh)"
fi

if type lsd >/dev/null 2>&1; then
  alias ls=lsd
  alias tree='lsd --tree'
else
  alias ls='ls --color=auto'
fi

abbr -S --quiet e=vim
abbr -S --quiet g=git
abbr -S --quiet ga='git add'
abbr -S --quiet gc='git commit'
abbr -S --quiet gs='git status'
abbr -S --quiet l=ls
abbr -S --quiet la='ls -A'
abbr -S --quiet ll='ls -Al'
abbr -S --quiet q=exit
abbr -S --quiet t=tree
alias egrep='grep -E --color=auto'
alias ex='vim -e'
alias grep='grep --color=auto'
alias rvim='vim -Z'
alias vi='vim -v'
alias view='vim -R'

. "${ZDOTDIR}/.p10k.zsh"
