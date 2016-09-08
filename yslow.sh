#!/bin/bash

DOMAIN="https://www.qa.hotwire.com"
if [ "$ENV" == "prod" ]; then
  DOMAIN="https://www.hotwire.com"
fi

export QT_QPA_PLATFORM=offscreen
PHANTOMJS="phantomjs --ssl-protocol=any --ignore-ssl-errors=yes"

I=0
for URL in $URLS; do
    let I=I+1
    echo "Report $I for $URL creating..."
    $PHANTOMJS "$(pwd)/yslow.patched.js" -i grade -thrashold "$THRESHOLD" -f junit "$DOMAIN$URL" | grep -v "FAIL to load" | sed "s@name=\"YSlow\"@name=\"$URL\"@g" > "reports/report$I.xml"
done
