#!/bin/bash

cd /cygdrive/c/node/gecko/node_modules/geckoboard/currency

# Download the json file with all the weather data
rm ./list.json
curl -o list.json "https://blockchain.info/ticker"

# Run JavaScript code and send data to Gecko
node currency.js
