###############################################################################
# p4 configuration 
###############################################################################

export P4USER=david.jarvis
export P4CLIENT=davidjarvis_laptop
#export P4CONFIG=/Users/davidjarvis/.p4config
export P4EDITOR=vim
export GNUTERM='x11'

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
# protobuf hacks
###############################################################################

alias protoc="protoc --python_out=./python --java_out=./java"

###############################################################################
# hadoop
###############################################################################

alias streaming="hadoop jar /usr/local/Cellar/hadoop/1.1.2/libexec/contrib/streaming/hadoop-streaming-1.1.2.jar"

###############################################################################
# PyPy
###############################################################################

alias pypy_easy_install="/usr/local/share/pypy/easy_install"
alias pypy_pip="/usr/local/share/pypy/pip"

###############################################################################
# Prompt
###############################################################################
# export PS1="\e[0;32m[\u@\h \W]\$ \e[m"
# export PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\033[01;34m\] \W'; else echo '\[\033[01;32m\]\u@\h\[\033[01;34m\] \w'; fi) \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\$\[\033[00m\] "
PS1='\[\e[1;37m\][\u@\h \W] \t $\[\e[0m\] '

###############################################################################
# Auto-completion script #
###############################################################################
if [ -f `brew --prefix`/etc/bash_completion ]; then
 . `brew --prefix`/etc/bash_completion
fi

###############################################################################
# Aliases go here #
###############################################################################
alias pmap="python ~/perforce/proserve/trunk/tools/metadata/provider_mapping.py" 

# Let's try using the Science DB for a while (n.b. the PSDB is "psdb" port 5533
alias psdb="psql -h sciencedb1-1-prod-iad.agkn.net -U jarvis -p 5533 psdb -w"
alias akdb="psql -h sciencedb1-1-prod-iad.agkn.net -U jarvis -p 5433 akdb -w"
alias v1db="psql -h sumdb1-1-prod-sjc.agkn.net -U jarvis -p 5433 akdb -w"
alias v2db="psql -h reportingdb_v2.agkn.net -U support_user -p 5000 akdb -w"
alias qadb="psql -h sumdb1-1-qa-sjc.agkn.net -p 5433 -U jarvis akdb -w"

alias emr="ruby ~/elastic-mapreduce-cli/elastic-mapreduce"
alias ll="ls -l"
alias getwd='pwd | tr -d "\r\n" | pbcopy'
alias mta_report="~/perforce/science/tools/mta/mta-reportgen/bin/mta_report --dbconfig ~/perforce/science/tools/mta-reportgen/jarvis_dbconfig.cfg"

###############################################################################
# GOPATH exports go here
###############################################################################
export GOPATH=/Users/jarvis/go
export PATH=$PATH:$GOPATH/bin

###############################################################################
# PYTHONPATH exports go here
###############################################################################
export PYTHONPATH=$PYTHONPATH:/Users/jarvis/Downloads/swampy-2.0
export PYTHONPATH=$PYTHONPATH:/Users/jarvis/Documents
export PYTHONPATH=$PYTHONPATH:/Users/jarvis/perforce

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###############################################################################
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/Cellar:$PATH
###############################################################################

# I'm lazy and want to boot into ak-sci-env right at terminal start
workon ak-sci-env
