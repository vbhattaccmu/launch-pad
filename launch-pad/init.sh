#!/bin/bash

AVAIL_TAG=v1.9.1
AVAIL_LC_BIN=https://github.com/availproject/avail-light/releases/download/$AVAIL_TAG/avail-light-linux-amd64.tar.gz

wget --no-check-certificate $AVAIL_LC_BIN -O avail-lc.tar.gz
tar -xf avail-lc.tar.gz
rm avail-lc.tar.gz
mv avail-light-linux-amd64 avail-light

num_folders=25

# Function to set parameters in the YAML file based on mode
update_yaml() {
    folder_name=$1
    mode=$2

    case $mode in
        server)
            http_server_port=$((8000 + i))
            port=$((39500 + i))
            seed=$((892936 + RANDOM % 1000))  

            echo "Running in server mode for $folder_name"
            perl -pi -e "s/http_server_port = 8000/http_server_port = $http_server_port/" "$folder_name/$config_file"
            perl -pi -e "s/port = 39500/port = $port/" "$folder_name/$config_file"
            perl -pi -e "s/secret_key = { seed=\"892936\" }/secret_key = { seed=\"$seed\" }/" "$folder_name/$config_file"
            ;;
        client)
            http_server_port=$((6999 + i))
            port=$((37000 + i))
            seed=$((292936 + RANDOM % 1000))  

            echo "Running in client mode for $folder_name"
            perl -pi -e "s/http_server_port = 6999/http_server_port = $http_server_port/" "$folder_name/$config_file"
            perl -pi -e "s/port = 37000/port = $port/" "$folder_name/$config_file"
            perl -pi -e "s/secret_key = { seed=\"292936\" }/secret_key = { seed=\"$seed\" }/" "$folder_name/$config_file"
            ;;
        fat)
            http_server_port=$((5999 + i))
            port=$((35000 + i))
            seed=$((392936 + RANDOM % 1000))  

            echo "Running in fat mode for $folder_name"
            perl -pi -e "s/http_server_port = 5999/http_server_port = $http_server_port/" "$folder_name/$config_file"
            perl -pi -e "s/port = 35000/port = $port/" "$folder_name/$config_file"
            perl -pi -e "s/secret_key = { seed=\"392936\" }/secret_key = { seed=\"$seed\" }/" "$folder_name/$config_file"
            ;;
        *)
            echo "Unknown mode: $mode"
            exit 1
            ;;
    esac
}

# Check for input argument
if [ -z "$1" ]; then
    echo "No mode provided. Usage: $0 {server|client|fat}"
    exit 1
fi

mode=$1
config_file="light-$mode.yml"

echo $config_file

for ((i=1; i<=num_folders; i++))
do
    folder_name="light$i"
    mkdir -p $folder_name
    rm -rf "$folder_name/avail_path"
    rm -rf "$folder_name/identity.toml"
    cp avail-light "$folder_name/"
    cp "$config_file" "$folder_name/$config_file"

    # Update specific parameters in the YAML file based on mode
    update_yaml $folder_name $mode
done
