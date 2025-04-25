function brew --wraps='sudo -Hu john /opt/homebrew/bin/brew' --description 'alias brew=sudo -Hu john /opt/homebrew/bin/brew'
  sudo -Hu john /opt/homebrew/bin/brew $argv; 
end
