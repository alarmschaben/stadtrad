#!/bin/bash
stationlist="/home/armin/stadtrad/stationlist.txt"
stations=`cut -b 1-4 $stationlist`

for s in $stations
do
    stationname[$s]="$(cat $stationlist | grep ^$s | cut -b 5- -)"
done

for stationID in $stations
do
    rrdtool xport -s now-3h -e now --step 300 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-3h.xml

    rrdtool xport -s now-24h -e now --step 900 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-24h.xml

    rrdtool xport -s now-48h -e now --step 1800 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-48h.xml

    rrdtool xport -s now-8d -e now --step 7200 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-1w.xml

    rrdtool xport -s now-1month -e now --step 10800 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-1m.xml

    rrdtool xport -s now-3month -e now --step 43200 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-3m.xml

    rrdtool xport -s now-1y -e now --step 86400 \
        DEF:a=/home/armin/rrd/${stationID}.rrd:${stationID}:AVERAGE \
        XPORT:a:"${stationname[$stationID]}" > /home/armin/html/xml/${stationID}-1y.xml
done
