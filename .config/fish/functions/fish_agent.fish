set -g SSH_ENV $HOME/.ssh/environment

function fish_agent
  killall ssh-agent 2> /dev/null
  if [ -f $SSH_ENV ]
      . $SSH_ENV > /dev/null
  end

  ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null

  if [ $status -eq 0 ]
      test_identities
  else
    set -e SSH_AGENT_PID
    set -e SSH_AUTH_SOCK
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
  end
  set -eg SSH_AUTH_SOCK $SSH_AUTH_SOCK 2> /dev/null
  set -eU SSH_AUTH_SOCK $SSH_AUTH_SOCK 2> /dev/null
  set -xU SSH_AGENT_PID $SSH_AGENT_PID 2> /dev/null
  set -xU SSH_AUTH_SOCK $SSH_AUTH_SOCK 2> /dev/null
  set -xg SSH_AUTH_SOCK $SSH_AUTH_SOCK 2> /dev/null
end


function test_identities
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [ $status -eq 0 ]
    ssh-add
  else
    if [ $status -eq 2 ]
      fish_agent
    end
  end
end

function ssh_agent --description 'launch the ssh-agent and add the id_rsa identity'
    if begin
            set -q SSH_AGENT_PID
            and kill -0 $SSH_AGENT_PID
            and ps -p $SSH_AGENT_PID | grep -q '^ssh-agent'
    end
        echo "ssh-agent running on pid $SSH_AGENT_PID"
    else
      set -e SSH_AUTH_SOCK
        eval (command ssh-agent -c | sed 's/^setenv/set -Ux/')
    end
    set -l identity $HOME/.ssh/id_rsa
    set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
    ssh-add -l | grep -q $fingerprint
        or ssh-add $identity
end
