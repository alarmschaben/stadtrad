#!/bin/bash

filename=/home/armin/project/stadtrad/fetch/`date +%s`.json

curl -s -d 'zoom=10&lng1=&lat1=&lng2=&lat2=&stadtCache=&mapstation_id=&mapstadt_id=75&verwaltungfirma=&centerLng=9.986872299999959&centerLat=53.56661530000001&searchmode=default&with_staedte=N&buchungsanfrage=N&bereich=2&stoinput=&before=&after=&ajxmod=hal2map&callee=getMarker&requester=index&key=&webfirma_id=510' http://stadtrad.hamburg.de/kundenbuchung/hal2ajax_process.php > $filename

#/home/armin/project/stadtrad/stadtrad/info.rb $filename | xargs
/home/armin/project/stadtrad/stadtrad/full.rb $filename
/home/armin/project/stadtrad/rrd/xport_selective.sh
