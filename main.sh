#!/bin/bash

if [ "$1" == "clean" ]; then
  rm -f reports/report*.xml
fi

DOCKER="sudo docker"

$DOCKER build -t yslow-docker .
$DOCKER run -e "ENV=$ENV" -e "URLS=$URLS" -e "THRESHOLD=$THRESHOLD" -v "$(pwd)":/usr/src/app yslow-docker /bin/bash /usr/src/app/yslow.sh
