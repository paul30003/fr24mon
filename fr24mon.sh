#!/usr/bin/env bash
###########################################################################
# Originally written by: Paul, 2016
# https://github.com/paul30003/fr24mon/
# License: GPL (>= 2.1) [http://www.gnu.org/licenses/gpl.html]
###########################################################################

PIDFILE=/var/run/fr24feed.pid

trigger="your ifttt trigger event name"

secret="your ifttt secret key"


# Test if FR24FEED is running

if [ -e "$PIDFILE" ]

then
 status_msg="FR24FEED Running"

else
 status_msg="FR24FEED Stopped"
fi

# Get Pi Data

tempC=`/opt/vc/bin/vcgencmd measure_temp`

running=`uptime -p`

# Send to IFTTT

json="{\"value1\":\"${tempC:5}\",\"value2\":\"${status_msg}\",\"value3\":\"${running:2}\"}"

curl -X POST -H "Content-Type: application/json" -d "${json}" https://maker.ifttt.com/trigger/${trigger}/with/key/${secret}
