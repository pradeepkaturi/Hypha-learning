#!/bin/bash

# Linux User Management Script

USER_CHECK=`whoami`
if [ "$USER_CHECK" != "root" ]; then
echo "Please run this script as root."
exit 1
fi

while true; do
clear
echo "=============================="
echo " User Account Management Tool"
echo "=============================="
echo "1. Add User"
echo "2. Modify User"
echo "3. Delete User"
echo "4. Set Password Policy"
echo "5. Exit"
echo "=============================="
read -p "Choose an option [1-5]: " choice

case $choice in
1)
read -p "Enter new username: " username
useradd -m "$username"
passwd "$username"
echo "User $username added successfully."
read -p "Press enter to continue..." ;;

```
2)
  read -p "Enter username to modify: " username
  echo "Select what you want to modify:"
  echo "1. Change Username"
  echo "2. Change Home Directory"
  read -p "Enter option [1-2]: " mod_option
  case $mod_option in
    1)
      read -p "Enter new username: " new_username
      usermod -l "$new_username" "$username"
      echo "Username changed to $new_username"
      ;;
    2)
      read -p "Enter new home directory: " new_home
      usermod -d "$new_home" -m "$username"
      echo "Home directory changed to $new_home"
      ;;
    *)
      echo "Invalid Option"
      ;;
  esac
  read -p "Press enter to continue..." ;;

3)
  read -p "Enter username to delete: " username
  read -p "Delete user's home directory as well? (y/n): " del_home
  if [ "$del_home" == "y" ]; then
    userdel -r "$username"
  else
    userdel "$username"
  fi
  echo "User $username deleted."
  read -p "Press enter to continue..." ;;

4)
  read -p "Enter username to set password policy: " username
  read -p "Enter maximum password age (in days): " max_age
  read -p "Enter minimum password age (in days): " min_age
  read -p "Enter warning period before expiry (in days): " warn_age
  chage -M "$max_age" -m "$min_age" -W "$warn_age" "$username"
  echo "Password policy updated for $username."
  read -p "Press enter to continue..." ;;

5)
  echo "Exiting User Management Tool."
  exit 0
  ;;

*)
  echo "Invalid option. Try again."
  read -p "Press enter to continue..." ;;

```

esac
done