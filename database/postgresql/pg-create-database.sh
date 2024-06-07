#!/bin/bash

# Checking arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <username> <password> <database_name> <host>"
    exit 1
fi

# Definitions of variables from arguments
USER=$1
SENHA=$2
NEW_DB=$3
HOST=$4
PORT="5432"

# Function to create the database
create_new_database() {
    PGPASSWORD=$SENHA psql -U $USER -h $HOST -p $PORT -d postgres -c "CREATE DATABASE $NEW_DB;"
}

# Check if the user wants to continue
echo "It will create a new database called '$NEW_DB' on the PostgreSQL server."
read -p "Do you wish to continue? (y/n): " confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "s" || $confirmation == "S" ]]; then
    create_new_database
    echo "Database '$NEW_DB' created successfully."
else
    echo "Operation canceled by user."
fi
