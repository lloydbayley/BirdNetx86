#!/usr/bin/env bash
source /etc/birdnet/birdnet.conf
echo ${APPRISE_WEEKLY_REPORT}

NOTIFICATION=$(curl 'localhost/views.php?view=Weekly%20Report&ascii=true')
NOTIFICATION=${NOTIFICATION#*#}
firstLine=`echo "${NOTIFICATION}" | head -1`
NOTIFICATION=`echo "${NOTIFICATION}" | tail -n +2`
$HOME/BirdNET-Pi/birdnet/bin/apprise -vv -t "${firstLine}" -b "${NOTIFICATION}" --config=$HOME/BirdNET-Pi/apprise.txt