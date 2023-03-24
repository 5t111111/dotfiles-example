################################################################################
# Uncomment the following line if you want to do profiling
################################################################################
# zmodload zsh/zprof && zprof

################################################################################
# Primary environment variables
################################################################################
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

################################################################################
# Load custom functions
################################################################################
() {
  local functions_dir="${ZDOTDIR}/functions"

  for function_file in `ls ${functions_dir}`; do
    source ${functions_dir}/${function_file}
  done
}

################################################################################
# 1Password SSH agent integration
# https://developer.1password.com/docs/ssh/agent/compatibility/#ssh-auth-sock
################################################################################
result="$(check-os-version)"

if [[ $? -eq 0 ]]; then
  case "$result" in
    macOS-*)
      if [[ -S "${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]]; then
        export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      fi
      ;;
  esac
fi

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
