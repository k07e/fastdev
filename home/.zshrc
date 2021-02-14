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
export N_PREFIX="${data_dir}/opt/n"
export PATH="${N_PREFIX}/bin:${PATH}"

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
zinit ice from'gh-r' as'program' mv'bat* -> bat' pick'bat/bat'; zinit load sharkdp/bat
zinit ice from'gh-r' as'program' mv'delta* -> delta' pick'delta/delta'; zinit load dandavison/delta
zinit ice from'gh-r' as'program' mv'fd* -> fd' pick'fd/fd'; zinit load sharkdp/fd
zinit ice from'gh-r' as'program' mv'hyperfine* -> hyperfine' pick'hyperfine/hyperfine'; zinit load sharkdp/hyperfine
zinit ice from'gh-r' as'program' mv'lsd* -> lsd' pick'lsd/lsd'; zinit load Peltoche/lsd
zinit ice from'gh-r' as'program' mv'ripgrep* -> ripgrep' pick'ripgrep/rg'; zinit load BurntSushi/ripgrep
zinit ice from'gh-r' as'program'; zinit load lotabout/skim

abbr -S --quiet e=vim
abbr -S --quiet g=git
abbr -S --quiet q=exit
alias ls='ls --color=auto'

. "${ZDOTDIR}/.p10k.zsh"
