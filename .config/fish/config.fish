# Start or re-use a gpg-agent.
#
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
# See: https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3?permalink_comment_id=4159058#gistcomment-4159058
#
set -e SSH_AGENT_PID
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

# Ensure GPG agent knows where the TTY is
# See: https://stackoverflow.com/a/44250739
# See: https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3?permalink_comment_id=4266495#gistcomment-4266495
#
set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
