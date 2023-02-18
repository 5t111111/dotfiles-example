() {
  local completions_dir=${ZDOTDIR}/completions

  #=============================================================================
  # Docker
  # https://docs.docker.com/desktop/mac/#zsh
  #=============================================================================
  local docker_mac_etc="/Applications/Docker.app/Contents//Resources/etc"

  if [ -d ${docker_mac_etc} ]; then
    if [ ! -e "${completions_dir}/_docker" ]; then
      ln -s ${docker_mac_etc}/docker.zsh-completion ${completions_dir}/_docker
      echo "INFO: Symlink [${completions_dir}/_docker] -> ["${docker_mac_etc}/docker.zsh-completion/_docker"] is created."
    fi

    if [ ! -e "${completions_dir}/_docker-compose" ]; then
      ln -s ${docker_mac_etc}/docker-compose.zsh-completion ${completions_dir}/_docker-compose
      echo "INFO: Symlink [${completions_dir}/_docker-compose] -> ["${docker_mac_etc}/docker-compose.zsh-completion/_docker_compose"] is created."
    fi
  fi

  #=============================================================================
  # Deno
  # https://deno.land/manual/getting_started/setup_your_environment
  #=============================================================================
  if type deno > /dev/null 2>&1; then
    if [ ! -e "${completions_dir}/_deno" ]; then
      deno completions zsh > ${completions_dir}/_deno
      echo "INFO: [${completions_dir}/_deno] is created."
    fi
  fi

  #=============================================================================
  # Add completions path to fpath and re-compinit
  #=============================================================================
  fpath=(${completions_dir} ${fpath})
}
