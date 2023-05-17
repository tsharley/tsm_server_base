#!/bin/sh

usage() {
  printf "create-sudo-user [-u|--username] &lt;username&gt;\n"
  printf " OPTIONS\n"
  printf "  -u --username\tusername of the new account (required)\n"
  printf "  -p --password\tpassword for the new account (optional)\n"
  printf "  -z --zsh\tuse zsh as the default shell (optional)\n"
  printf "  -h --help\tprint this help\n"
  exit 1
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -u|--username) username="$2" shift ;;
    -p|--password) password="$2" shift ;;
          z|--zsh) zsh=true shift;;
        -h|--help) usage ;;
                *) usage ;;
  esac
  shift
done

[ -z "$username" ] && usage
[ -z "$password" ] && password=$(uuidgen | cut -d'-' -f1)

useradd -m "$username" -p "$password" > /dev/null 2>&1

#------------#
# VARIATIONS #
#------------#
# useradd -m "$username"
# echo -n "$password\n$password\n" | passwd $username"
# echo "${username}:${password}" | chpasswd

if [ "$?" -eq 0 ]; then
  echo "Username: $username"
  echo "Password: $password"
  usermod -aG sudo "$username"
  echo "Added $username to sudo group"
  echo "User account set up successfully"
else
  echo "Failed to set up user account"
  userdel -f "$username"
fi
