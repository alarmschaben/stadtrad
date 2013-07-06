#!/bin/bash

rrdtool xport -s now-3h -e now --step 300 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes3h.xml

rrdtool xport -s now-24h -e now --step 900 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes24h.xml

rrdtool xport -s now-48h -e now --step 1800 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes48h.xml

rrdtool xport -s now-8d -e now --step 7200 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes1w.xml

rrdtool xport -s now-1month -e now --step 10800 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes1m.xml

rrdtool xport -s now-3month -e now --step 43200 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes3m.xml

rrdtool xport -s now-1y -e now --step 86400 \
DEF:a=/home/armin/rrd/stadtrad.rrd:hammerbrook:AVERAGE \
DEF:b=/home/armin/rrd/stadtrad.rrd:berlinertor:AVERAGE \
XPORT:a:"Hammerbrook" \
XPORT:b:"Berliner Tor" > /home/armin/html/xml/bikes1y.xml
