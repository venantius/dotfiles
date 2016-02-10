source ~/.config/fish/colors/solarized.fish

function prompt_git_status --description 'Write out the git status'
  ## early exit for Chromium & Blink repo, as the dirty check takes ~5s
  set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree --short HEAD ^/dev/null)
  test -n "$repo_info"; or return
  printf ' on%s ' (__fish_git_prompt)
end

function _git_current_branch -d "Output git's current branch name"
  begin
    git symbolic-ref --quiet --short HEAD; or \
    git describe --all --exact-match HEAD; or \
    git rev-parse --short HEAD; or '(unknown)'
  end ^/dev/null | sed -e 's|^refs/heads/||'
end

function fish_prompt --description 'Write out the prompt'

  echo "" # blank line

  # get current values
  set cur_user (whoami)
  set cur_host (hostname -s)
  set cur_cwd (echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||')

  echo -n '['
  set_color $violet;          echo -n (whoami)
  set_color normal;           echo -n '@'
  set_color $cyan;          echo -n (hostname -s)
  set_color normal;           echo -n ':'
  set_color $yellow;            echo -n $cur_cwd
  set_color normal;       echo -n ']'

  set_color normal;                prompt_git_status

  echo ""
  echo -n '▸ '

  set_color normal
end
