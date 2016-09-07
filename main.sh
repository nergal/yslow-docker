#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage:"
    echo "$0 <minimal grade> <domain> <comma-separated list of urls>"
    exit -1
fi

TRASHOLD=$1 # 85
DOMAIN=$2 # https://www.qa.hotwire.com
URLS=$3 # /,/cars,/app

PHANTOMJS="node_modules/.bin/phantomjs --ignore-ssl-errors=true"

I=0
for URL in $(echo $URLS | tr "," " "); do
    let I=I+1
    CMD="$PHANTOMJS $(pwd)/yslow.js -i grade -thrashold $TRASHOLD -f junit $DOMAIN$URL | grep -v \"FAIL to load\" > reports/report$I.xml"

    echo "Report for $URL creating..."
    eval $CMD
done