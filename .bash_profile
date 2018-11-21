#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc &&
TZ='America/New_York'; export TZ

eval $(ssh-agent)
ssh-add
