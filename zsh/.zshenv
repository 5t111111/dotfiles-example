################################################################################
# Uncomment the following line if you want to do profiling
################################################################################
# zmodload zsh/zprof && zprof

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

################################################################################
# Avoid PATH is overwritten by path_helper
# https://github.com/Homebrew/homebrew-core/pull/32074#issuecomment-421381869
################################################################################
unsetopt globalrcs

################################################################################
# PATH
################################################################################
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/.deno/bin"
  "$HOME/.composer/vendor/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/opt/local/bin"
  "/opt/local/sbin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  $path
)
