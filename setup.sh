#!/bin/bash

function pw_check() {
  [ ! -f ~/.pw ] && echo "Please create a password file at ~/.pw and rerun setup.sh."; return
  echo "Running next..."
}

pw_check

if [ -f ~/.pw ]; then
    cp -r "$(pwd)"/skel /etc/skel
    chmod +x "$(pwd)"/create_sudo_user.sh
    ./$"(pwd)/create_sudo_user.sh"
    echo 'Installation complete'
fi
