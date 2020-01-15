function gitunyaw -d "Replace Git SSH remote by HTTPS"
  if not git status >/dev/null 2>&1
    echo "This doesn't look to be a git repository"
    return 1
  end

  if test (count $argv) -gt 0
    set remotes $argv
  else
    if not set remotes (command git remote show)
      echo "No remote available"
      return 1
    end
  end

  for remote in $remotes
    echo "Processing remote $remote..."
    set ssh (command git remote get-url $remote)

    if echo $ssh | grep -q 'https://.*'
      echo "Git remote looks to be already a valid HTTPS remote" 
    else
      set regex 's/git@\(.*\):\(.*\)\/\(.*\)\.git/https:\/\/\1\/\2\/\3.git/'
      echo $ssh | sed -e "$regex" | read -l https
      command git remote set-url "$remote" "$https"
      echo "Replaced '$ssh' by '$https'"
    end
  end
end
