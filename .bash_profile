###############################################################################
# general shell
###############################################################################

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar:$PATH

# I've already spent way too much time editing this, heh.
PS1='[\[\e[0;95m\]\u\[\e[0;36m\]@\h:\[\e[0m\]\[\e[0;33m\]\W\[\e[0m\]] \t $\[\e[m\] '
export PS1=$PS1

# Just nice to know what colors look like on this platform/color scheme :)
function color_list() {
    echo -e "\x1B[31m[Red]\x1B[0m"
    echo -e "\x1B[32m[Green]\x1B[0m"
    echo -e "\x1B[33m[Yellow]\x1B[0m"
    echo -e "\x1B[34m[Blue]\x1B[0m"
    echo -e "\x1B[35m[Magenta]\x1B[0m"
    echo -e "\x1B[36m[Cyan]\x1B[0m"
    echo -e "\x1B[37m[Light Grey]\x1B[0m"
    echo -e "\x1B[90m[Dark Grey]\x1B[0m"
    echo -e "\x1B[91m[Light Red]\x1B[0m"
    echo -e "\x1B[92m[Light Green]\x1B[0m"
    echo -e "\x1B[93m[Light Yellow]\x1B[0m"
    echo -e "\x1B[94m[Light Blue]\x1B[0m"
    echo -e "\x1B[95m[Light Magenta]\x1B[0m"
}
export LANG=en_US.UTF-8

# aliases
alias less='less -R' # syntax highlight
alias ll='ls -AgGhl'
alias ls="ls -G"
alias getwd='pwd | tr -d "\r\n" | pbcopy'
alias supergrep="grep --color -n -C 2 -r"

###############################################################################
# development environment
###############################################################################

# clojure
lein() {
    if [[ $1 == "figwheel" ]]; then
        command rlwrap lein figwheel
    else
        command lein "$@"
    fi
}

# git
alias gco='git checkout'

# golang
export GOPATH=/Users/$USER/Code/go
export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOPATH/bin

# postgres
export PGDATA=/usr/local/pgsql/data

# python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
alias pypy_easy_install="/usr/local/share/pypy/easy_install"
alias pypy_pip="/usr/local/share/pypy/pip"
export PYTHONPATH=$PYTHONPATH:/Users/$USER/Documents
export PYTHONDONTWRITEBYTECODE=TRUE

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###############################################################################
# contextual
###############################################################################

if [ -f ~/.work.sh ]; then
    . ~/.work.sh
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
