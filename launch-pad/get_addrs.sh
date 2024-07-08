#!/bin/bash

LOG_FILE="run.txt"

extracted_text=$(grep "Avail ss58 address" "$LOG_FILE" | awk -F 'Avail ss58 address: ' '{print $2}' | awk -F ', public key:' '{print $1}')
lowercase_text=$(echo "$extracted_text" | tr '[:upper:]' '[:lower:]')
formatted_extracted_text=$(echo "$extracted_text" | sed 's/ /  /g')
echo "Avail Addresses in this setup are:"
echo ""
echo "$formatted_extracted_text"
echo ""
echo "Printing addresses in lower case for DataDog entries:"
echo ""
formatted_lowercase_text=$(echo "$lowercase_text" | sed 's/ /  /g')
echo "$formatted_lowercase_text"
