#!/bin/bash

cd /cygdrive/c/node/gecko/node_modules/geckoboard/weather

rm ./list.json

# Download the json file with all the weather data
curl -o list.json "http://api.openweathermap.org/data/2.5/forecast?q=London&units=metric&APPID=408fd8dff191b39731084ee16e4150fc"

# Modify the data to have it in the right format.
# It would be better to parse the JSON object and store all information
sed -i 's/{"city":{"id":[0-9]\+,.*"list"://g' list.json
sed -i 's/}\]}/}\]/g' list.json
sed -i 's/{"dt"/\n{"dt"/g' list.json
sed -i 's/"dt".*"temp"/"temp"/g' list.json
sed -i 's/"temp_min".*"pressure"/"pressure"/g' list.json
sed -i 's/"sea_level".*"main"/"weather"/g' list.json
sed -i 's/"icon".*"speed"/"wind_speed"/g' list.json
sed -i 's/"deg".*"rain"/"rain"/g' list.json
sed -i 's/{"3h":\([0-9]\+\)\.\([0-9]\+\)}/\1\.\2/g' list.json
sed -i 's/{}/0/g' list.json
sed -i 's/"sys".*"dt_txt"/"time"/g' list.json
sed -i 's/\([0-9]\{4\}-[0-9][0-9]-[0-9][0-9]\) \([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\)/\1T\2Z/g' list.json

# Append the city name to all entries. Should be done dinamically with some tricky sed move, or parsing the JSON properly.
sed -i 's/{/{"city":"London",/g' list.json

