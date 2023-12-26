sc_all_5_errors.sh;
sc_all_5_http.sh;
sc_all_5_tolkoIP.sh;
sc_all_5_tolkoURL.sh;

echo 'Attachment' | mail -s 'Attached files to now from ' $(tail -n 1 ./datesc.txt) -a /tmp/ipOut.txt -a /tmp/urlOut.txt -a /tmp/httpOut.txt -a /tmp/errorOut.txt lokly19@gmail.com;
