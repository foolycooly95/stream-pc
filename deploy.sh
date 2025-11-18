#!/bin/bash
mkdir output
touch output/meta-data
cp autoinstall.yaml output/user-data
LOWER_USERNAME=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
PASSWORD_HASH=$(openssl passwd -6 "$PASSWORD")
sed -i "s|\${PASSWORD_HASH}|$PASSWORD_HASH|g" output/user-data
sed -i "s|\${REALNAME}|$NAME|g" output/user-data
sed -i "s|\${USERNAME}|$LOWER_USERNAME|g" output/user-data

# Remove all comments except for the first line and any blank lines
sed -i '1!{/^#/d; /^$/d}' output/user-data
