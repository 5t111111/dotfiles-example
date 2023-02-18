################################################################################
# direnv
# https://github.com/direnv/direnv
################################################################################
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
else
  echo -e "WARN: direnv is not installed"
fi
