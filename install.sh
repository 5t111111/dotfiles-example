#!/usr/bin/env bash

set -Ceu

# ANSI Escape Color Codes
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

UNAME="`uname`"

case $UNAME in
  'Linux')
    OS='Linux'
    ;;
  # 'FreeBSD')
  #   OS='FreeBSD'
  #   ;;
  # 'WindowsNT')
  #   OS='Windows'
  #   ;;
  'Darwin')
    OS='Mac'
    ;;
  # 'SunOS')
  #   OS='Solaris'
  #   ;;
  # 'AIX') ;;
  *) ;;
esac

pushd "$(dirname $0)" > /dev/null
SCRIPT_PATH="$(pwd -P)"

# ==============================================================================

cat << EOS

================================================================================
Setting up XDG Config Base Directory
================================================================================
EOS

if [ ! -d "${XDG_CONFIG_HOME:=$HOME/.config}" ] ; then
  mkdir -p "${XDG_CONFIG_HOME}"
else
  echo -e "${BLUE}WARN: XDC Base directory: [${XDG_CONFIG_HOME}] already exists${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup global Git config
================================================================================
EOS

if [ -e "${GIT_CONFIG_DIR:=$XDG_CONFIG_HOME/git}" ] && [ ! -L "${GIT_CONFIG_DIR}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${GIT_CONFIG_DIR}] because it already exists.${NC}"
else
  if [ -L "${GIT_CONFIG_DIR}" ] ; then
    rm "${GIT_CONFIG_DIR}"
    echo -e "${BLUE}WARN: Existing symlink [${GIT_CONFIG_DIR}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/git" "${GIT_CONFIG_DIR}"
  echo -e "${CYAN}INFO: Symlink [${GIT_CONFIG_DIR}] is created.${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup GitHub CLI
================================================================================
EOS

if [ -e "${GH_CLI_CONFIG_DIR:=$XDG_CONFIG_HOME/gh}" ] && [ ! -L "${GH_CLI_CONFIG_DIR}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${GH_CLI_CONFIG_DIR}] because it already exists.${NC}"
else
  if [ -L "${GH_CLI_CONFIG_DIR}" ] ; then
    rm "${GH_CLI_CONFIG_DIR}"
    echo -e "${BLUE}WARN: Existing symlink [${GH_CLI_CONFIG_DIR}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/gh" "${GH_CLI_CONFIG_DIR}"
  echo -e "${CYAN}INFO: Symlink [${GH_CLI_CONFIG_DIR}] is created.${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup Starship
================================================================================
EOS

if [ -e "${STARSHIP_CONFIG_FILE:=$XDG_CONFIG_HOME/starship.toml}" ] && [ ! -L "${STARSHIP_CONFIG_FILE}" ] ; then
  echo -e "${RED}ERROR: Failed to create symlink [${STARSHIP_CONFIG_FILE}] because it already exists.${NC}"
else
  if [ -L "${STARSHIP_CONFIG_FILE}" ] ; then
    rm "${STARSHIP_CONFIG_FILE}"
    echo -e "${BLUE}WARN: Existing symlink [${STARSHIP_CONFIG_FILE}] is deleted.${NC}"
  fi

  ln -s "${SCRIPT_PATH}/starship.toml" "${STARSHIP_CONFIG_FILE}"
  echo -e "${CYAN}INFO: Symlink [${STARSHIP_CONFIG_FILE}] is created.${NC}"
fi

# ==============================================================================

cat << EOS

================================================================================
Setup ZSH
================================================================================
EOS

cat << EOS

Checking zsh installation
--------------------------------------------------------------------------------
EOS

if type zsh > /dev/null 2>&1 ; then
  echo -e "${CYAN}INFO: zsh is installed.${NC}"
else
  echo -e "${RED}ERROR: zsh is not found.${NC}"
  echo -e "Please install zsh before executing this setup script."
  exit 1
fi

cat << EOS

Run zsh setup script
--------------------------------------------------------------------------------
EOS

zsh "${SCRIPT_PATH}/zsh/setup.zsh"

# ==============================================================================

cat << EOS

================================================================================
Check required command line tools
================================================================================
EOS

TOOLS=( \
  fzf \
)

for i in "${TOOLS[@]}"; do
  if type "${i}" > /dev/null 2>&1 ; then
    echo -e "${CYAN}INFO: ${i} is not found. Please install it manually${NC}"
  fi
done

# ==============================================================================

popd > /dev/null
