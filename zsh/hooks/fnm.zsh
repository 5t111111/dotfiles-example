################################################################################
# fnm
# https://github.com/Schniz/fnm
################################################################################
if type fnm > /dev/null; then
  eval "$(fnm env --use-on-cd)"
elif [ -f "${HOME}/.local/share/fnm/fnm" ] && [ -x "${HOME}/.local/share/fnm/fnm" ]; then
  # fnm executable is not in PATH, but it exists in Linux intall location
  path=(
    "${HOME}/.local/share/fnm"
    $path
  )
  eval "$(fnm env --use-on-cd)"
else
  echo -e "WARN: fnm is not installed"
fi
