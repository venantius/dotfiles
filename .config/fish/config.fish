source ~/.config/fish/colors/solarized.fish
source ~/.config/fish/functions/fish_agent.fish

alias gk='fish_key'
alias start-agent='fish_agent'

alias gp='git pull'
alias gst='git status'

set -x GOPATH $HOME/Code/go
set -x GO15VENDOREXPERIMENT 1
set -x PATH /usr/local/sbin $PATH
set -x PATH /Users/william_jarvis/airlab-beta/repos/sysops/one_offs $PATH
set -x PATH /Users/william_jarvis/.rvm $PATH
set -x JAVA_HOME (/usr/libexec/java_home)
set -x JAVA8_HOME (/usr/libexec/java_home)
rvm default
