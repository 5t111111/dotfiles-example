case "${OSTYPE}" in
darwin*)
  alias ls="ls -Gh"
  alias ll="ls -lGhA"
  ;;
linux*)
  alias ls='ls -h --color'
  alias ll='ls -lhA --color'
  ;;
esac

alias zmv='noglob zmv -W'
alias g='git'
alias e='emacsclient -nw'
alias ghw='gh repo view --web'
