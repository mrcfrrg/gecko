#!/bin/bash

cd /cygdrive/c/node/gecko/node_modules/geckoboard/weather

rm ./list.json
./generate_list_pisa.sh

# Append the data in the right script
# A quick solution that should be substituted by having the JS code import the JSON list
rm ./dataset_update_curl_run.sh
sed '/"data":/r list.json' dataset_update_curl.sh >> dataset_update_curl_run.sh

# Send update data to Gecko
./dataset_update_curl_run.sh
