################################################################################
# Starship
# https://starship.rs
################################################################################
if type starship > /dev/null; then
  eval "$(starship init zsh)"
else
  echo -e "WARN: starship is not installed"

  if [ "$CODESPACES" = "true" ] || [ "$REMOTE_CONTAINERS" = true ] ; then
    echo -e "INFO: Start Starship installation because it is running in Codespaces or Remote Containers"
    curl -fsSL https://starship.rs/install.sh -o /tmp/starship_install.sh \
      && chmod 755 /tmp/starship_install.sh \
      && /tmp/starship_install.sh -y
    eval "$(starship init zsh)"
  fi
fi
