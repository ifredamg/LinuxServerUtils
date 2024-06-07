#!/bin/bash

# Checking arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <username> <password> <database_name> <host>"
    exit 1
fi

# Definitions of variables from arguments
USER=$1
PASSWORD=$2
NEW_DB=$3
HOST=$4
PORT="3306"

# Function to create the database
create_new_database() {
    mysql -u $USER -p$PASSWORD -h $HOST -P $PORT -e "CREATE DATABASE $NEW_DB;"
}

# Check if the user wants to continue
echo "It will create a new database called '$NEW_DB' on the MySQL server."
read -p "Do you wish to continue? (y/n): " confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "s" || $confirmation == "S" ]]; then
    create_new_database
    echo "Database '$NEW_DB' created successfully."
else
    echo "Operation canceled by user."
fi
