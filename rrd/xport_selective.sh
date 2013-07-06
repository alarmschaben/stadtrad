#!/bin/bash
stationlist="/home/armin/project/stadtrad/stadtrad/stationlist.txt"
stations=`cut -b 1-4 $stationlist`

for s in $stations
do
    stationname[$s]="$(cat $stationlist | grep ^$s | cut -b 5- -)"
done

exportStation0=2651
exportStation1=2544
exportStation2=2536
exportStation3=2533
exportStation4=2251


rrdtool xport -s now-3h -e now --step 300 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes3h.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes3h.xml

rrdtool xport -s now-24h -e now --step 900 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes24h.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes24h.xml

rrdtool xport -s now-48h -e now --step 1800 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes48h.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes48h.xml

rrdtool xport -s now-8d -e now --step 7200 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes1w.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes1w.xml

rrdtool xport -s now-1month -e now --step 10800 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes1m.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes1m.xml

rrdtool xport -s now-3month -e now --step 43200 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes3m.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes3m.xml

rrdtool xport -s now-1y -e now --step 86400 \
DEF:a=/home/armin/project/stadtrad/rrd/${exportStation0}.rrd:${exportStation0}:AVERAGE \
DEF:b=/home/armin/project/stadtrad/rrd/${exportStation1}.rrd:${exportStation1}:AVERAGE \
DEF:c=/home/armin/project/stadtrad/rrd/${exportStation2}.rrd:${exportStation2}:AVERAGE \
DEF:d=/home/armin/project/stadtrad/rrd/${exportStation3}.rrd:${exportStation3}:AVERAGE \
DEF:e=/home/armin/project/stadtrad/rrd/${exportStation4}.rrd:${exportStation4}:AVERAGE \
XPORT:a:"${stationname[$exportStation0]}" \
XPORT:b:"${stationname[$exportStation1]}" \
XPORT:c:"${stationname[$exportStation2]}" \
XPORT:d:"${stationname[$exportStation3]}" \
XPORT:e:"${stationname[$exportStation4]}" > /home/armin/project/stadtrad/html/xml/bikes1y.xml
sed -i 's/ISO-8859-1/UTF-8/' /home/armin/project/stadtrad/html/xml/bikes1y.xml
