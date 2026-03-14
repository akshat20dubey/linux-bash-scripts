#!/bin/bash
# =============================================
# Script: user-manager.sh
# Description: Create, delete, or list Linux users
# Author: Akshat Dubey
# Usage: Run as sudo
# =============================================

echo "======================================"
echo "          LINUX USER MANAGER"
echo "======================================"
echo ""
echo "1. Create a new user"
echo "2. Delete a user"
echo "3. List all users"
echo "4. Exit"
echo ""
read -p "Choose an option (1-4): " OPTION

case $OPTION in
  1)
    read -p "Enter username to create: " USERNAME
    if id "$USERNAME" &>/dev/null; then
      echo "❌ User '$USERNAME' already exists."
    else
      sudo useradd -m "$USERNAME"
      echo "✅ User '$USERNAME' created successfully."
      echo "Setting password for $USERNAME:"
      sudo passwd "$USERNAME"
    fi
    ;;
  2)
    read -p "Enter username to delete: " USERNAME
    if id "$USERNAME" &>/dev/null; then
      sudo userdel -r "$USERNAME"
      echo "✅ User '$USERNAME' deleted."
    else
      echo "❌ User '$USERNAME' does not exist."
    fi
    ;;
  3)
    echo ""
    echo "======================================"
    echo "         ALL SYSTEM USERS:"
    echo "======================================"
    cut -d: -f1 /etc/passwd | sort
    ;;
  4)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "❌ Invalid option. Please choose 1-4."
    ;;
esac

echo "======================================"
