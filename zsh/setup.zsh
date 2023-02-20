#!/usr/bin/env zsh

RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

pushd "$(dirname $0)" > /dev/null
SCRIPT_PATH="$(pwd -P)"

cat << EOS

ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
Setting up XDG Base Directory
ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
EOS

if [ ! -d "${XDG_CONFIG_HOME:=$HOME/.config}" ] ; then
  mkdir -p "${XDG_CONFIG_HOME}"
else
  echo -e "${BLUE}WARN: XDC Base directory: [${XDG_CONFIG_HOME}] already exists${NC}"
fi

cat << EOS

ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
Creating symlink to zsh config
ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
EOS

if [ -e "${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}" ] && [ ! -L "${ZDOTDIR}" ] ; then
    echo -e "${RED}ERROR: Failed to create symlink [${ZDOTDIR}] because it already exists.${NC}"
else
    if [ -L "${ZDOTDIR}" ] ; then
        rm "${ZDOTDIR}"
        echo -e "${BLUE}WARN: Existing symlink [${ZDOTDIR}] is deleted.${NC}"
    fi

    ln -s "${SCRIPT_PATH}" "${ZDOTDIR}"
    echo -e "${CYAN}INFO: Symlink [${ZDOTDIR}] -> ["${SCRIPT_PATH}"] is created.${NC}"
fi

cat << EOS

ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
Creating symlink of .zshenv
ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
EOS

if [ -e "${ZSHENV_PATH:=$HOME/.zshenv}" ] && [ ! -L "${ZSHENV_PATH}" ]; then
    echo -e "${RED}ERROR: Failed to create symlink [${ZSHENV_PATH}] because it already exists.${NC}"
else
    if [ -L "${ZSHENV_PATH}" ] ; then
        rm "${ZSHENV_PATH}"
        echo -e "${BLUE}WARN: Existing symlink [${ZSHENV_PATH}] is deleted.${NC}"
    fi

    ln -s "${ZDOTDIR}/.zshenv" "${ZSHENV_PATH}"
    echo -e "${CYAN}INFO: Symlink [${ZSHENV_PATH}] -> ["${ZDOTDIR}/.zshenv"] is created.${NC}"
fi

cat << EOS

ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
ZSH setup complete!
ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
Recommended way to configure your local specific configuration is
adding settings in [${ZDOTDIR}/local.zshrc]
instead of [${ZDOTDIR}/.zshrc].
EOS

popd > /dev/null
