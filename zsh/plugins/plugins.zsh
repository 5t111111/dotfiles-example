() {
  local plugins_dir=${ZDOTDIR}/plugins

  #=============================================================================
  # zsh-autosuggestions
  # https://github.com/zsh-users/zsh-autosuggestions
  #=============================================================================
  if [ ! -d ${plugins_dir}/zsh-autosuggestions ] ; then
    echo -e "${CYAN}INFO: Install zsh-autosuggestions to ${plugins_dir}/zsh-autosuggestions${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${plugins_dir}/zsh-autosuggestions
  fi

  source ${plugins_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  #=============================================================================
  # zsh-syntax-highlighting
  # https://github.com/zsh-users/zsh-syntax-highlighting
  #=============================================================================
  if [ ! -d ${plugins_dir}/zsh-syntax-highlighting ] ; then
    echo -e "${CYAN}INFO: Install zsh-syntax-highlighting to ${plugins_dir}/zsh-syntax-highlighting${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${plugins_dir}/zsh-syntax-highlighting
  fi

  source ${plugins_dir}/zsh-autosuggestions/zsh-autosuggestions.zsh
}
