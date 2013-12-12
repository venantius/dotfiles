###############################################################################
# virtualenvwrapper
###############################################################################
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

###############################################################################
# postgres settings
###############################################################################
export PGDATA=/usr/local/pgsql/data

###############################################################################
# PyPy
###############################################################################
alias pypy_easy_install="/usr/local/share/pypy/easy_install"
alias pypy_pip="/usr/local/share/pypy/pip"

###############################################################################
# Prompt
###############################################################################
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
export TERM=xterm-256color

###############################################################################
# Aliases go here #
###############################################################################
alias ls="ls -G"
alias ll="ls -l"
alias getwd='pwd | tr -d "\r\n" | pbcopy'

###############################################################################
# Exports go here 
###############################################################################
export LANG=en_US.UTF-8

###############################################################################
# GOPATH exports go here
###############################################################################
export GOPATH=/Users/$USER/go
export PATH=$PATH:$GOPATH/bin

###############################################################################
# PYTHONPATH exports go here
###############################################################################
export PYTHONPATH=$PYTHONPATH:/Users/$USER/Documents
export PYTHONPATH=$PYTHONPATH:/Users/$USER/perforce

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###############################################################################
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar:$PATH
###############################################################################

# I'm lazy and want to boot into my core virtualenv right at terminal start
workon core-dev
