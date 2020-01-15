function gityaw -d "Replace Git HTTPS remote by SSH"
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
    set https (command git remote get-url $remote)

    if echo $https | grep -q '.*@.*:.*'
      echo "Git remote looks to be already a valid SSH remote" 
    else
      set regex 's/https:\/\/\(.*\)\/\(.*\)\/\(.*\)\(.git\)*/git@\1:\2\/\3.git/' 
      echo $https | sed -e "$regex" | sed -e 's/\.git\.git$/\.git/' | read -l ssh
      command git remote set-url "$remote" "$ssh"
      echo "Replaced '$https' by '$ssh'"
    end
  end
end
