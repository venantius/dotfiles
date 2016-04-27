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
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
  end
  set -xU SSH_AGENT_PID $SSH_AGENT_PID 2> /dev/null
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
