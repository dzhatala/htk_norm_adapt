#!/usr/bin/gawk -f

BEGIN {
	line=0;
	sil_found=0;

	print "~h \"sp\""
	print "<BEGINHMM>"
	print "<NUMSTATES> 3"

}
{
	line++;
	if(sil_found>0)
	if(line>sil_found+8)
	if(line<sil_found+15){
		sp=$0;
		if(line==sil_found+9){
			sp = "<STATE>2 ";
		}
		print sp;
	}
	if (index($0,"sil\"")>0){
		#print "sil\" found at", line  ;
		sil_found=line;
	}
}

END {

print "<TRANSP> 3"
print "0.000000e+00 1.000000e+00 0.000000e+00" 
print "0.000000e+00 9.336483e-01 6.635173e-02" 
print "0.000000e+00 0.000000e+00 4.361468e-01" 
print "<ENDHMM>"

}