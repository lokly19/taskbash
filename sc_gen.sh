#!/bin/bash

lockFile=/var/tmp/scr
if [ -f $lockFile ]; then
    echo Job is already running\!
    exit 0
fi
touch $lockFile
trap 'rm -f "$lockFile"; exit $?' INT TERM EXIT

bash sc_all_5_errors.sh;
bash sc_all_5_http.sh;
bash sc_all_5_tolkoIP.sh;
bash sc_all_5_tolkoURL.sh;

echo 'Attachment' | mail -s 'Attached files to now from ' $(tail -n 1 ./datesc.txt) -a /tmp/ipOut.txt -a /tmp/urlOut.txt -a /tmp/httpOut.txt -a /tmp/errorOut.txt lokly19@gmail.com;

rm -f $lockFile
trap - INT TERM EXIT
