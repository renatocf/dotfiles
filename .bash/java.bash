# enable colors in Apache Ant
alias ant='ant -logger org.apache.tools.ant.listener.AnsiColorLogger'

# Ant colors
export ANT_OPTS="-Dant.logger.defaults=${HOME}/.bash/colors.ant"
