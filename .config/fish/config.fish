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

command --search $rvm >/dev/null; and begin
  rvm default
end

if not begin
    # Is the agent running already? Does the agent-info file exist, and if so,
    # is there a process with the pid given in the file?
    [ -f ~/.gpg-agent-info ]
    and kill -0 (cut -d : -f 2 ~/.gpg-agent-info) ^/dev/null
end
    # no, it is not running. Start it!
    gpg-agent --daemon --no-grab --write-env-file ~/.gpg-agent-info >/dev/null ^&1
end
# get the agent info from the info file, and export it so GPG can see it.
set -gx GPG_AGENT_INFO (cut -c 16- ~/.gpg-agent-info)
set -gx GPG_TTY (tty)
