################################################################################
# fnm
# https://github.com/Schniz/fnm
################################################################################
if type fnm > /dev/null; then
  eval "$(fnm env --use-on-cd)"
else
  echo -e "WARN: fnm is not installed"
fi
