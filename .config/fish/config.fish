set fish_git_color red --bold

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  echo (set_color $fish_git_color)"("$branch")"(set_color normal)
end

function fish_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '%s@%s %s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (parse_git_branch) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  else
    printf '%s@%s %s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end
