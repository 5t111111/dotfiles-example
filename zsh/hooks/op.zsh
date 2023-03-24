################################################################################
# 1Password CLI
# https://developer.1password.com/docs/cli
################################################################################
if type op > /dev/null; then
  if [ -f "${HOME}/.config/op/plugins.sh" ]; then
    source "${HOME}/.config/op/plugins.sh"
  fi
fi
