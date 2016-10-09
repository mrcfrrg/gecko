#!/bin/bash

cd /cygdrive/c/node/gecko/node_modules/geckoboard/weather

#curl -X DELETE -u '1bfdb1e922b674444b44e18fe1ab5725:' https://api.geckoboard.com/datasets/weather
rm ./list.json

# Create data model
node create_data_model.js
