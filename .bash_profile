#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc &&
TZ='America/Chicago'; export TZ

eval $(ssh-agent)
ssh-add
