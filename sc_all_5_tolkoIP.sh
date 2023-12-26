date +"%Y%m%d%H%M%S" >> datesc.txt;

lastdate=$(tail -n 1 ./datesc.txt);
	     

awk 'BEGIN {
FS=" "
}
{
d=substr ($4,2, 2)
m=substr ($4,5, 3)
y=substr ($4,9, 4)
h=substr ($4,14, 2)
min=substr ($4,17, 2)
s=substr ($4,20, 2)
mmm=0;
if (m == "Jan") {mmm = "01"}
if (m == "Feb") {mmm = "02"}
if (m == "Mar") {mmm = "03"}
if (m == "Apr") {mmm = "04"}
if (m == "May") {mmm = "05"}
if (m == "Jun") {mmm = "06"}
if (m == "Jul") {mmm = "07"}
if (m == "Avg") {mmm = "08"}
if (m == "Sen") {mmm = "09"}
if (m == "Oct") {mmm = "10"}
if (m == "Nov") {mmm = "11"}
if (m == "Dec") {mmm = "12"}

nd = y mmm d h min s
if (nd > '"$lastdate"'){
print $1

}else{
}
;

} 
END {

}' ./apache.log | sort | uniq -c | sort -nk1 > /tmp/ipOut.txt;

