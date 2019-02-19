#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc &&
TZ='America/New_York'; export TZ

eval $(ssh-agent) > /dev/null
ssh-add 2> /dev/null
