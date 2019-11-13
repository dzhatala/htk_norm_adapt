BEGIN {
}
{

	if (!prefix1){

				#print FILENAME
				#print $0;
				i1 = index (FILENAME,".lab");
				prefix=substr(FILENAME,1,i1-1);
				pref_mfc=prefix
				islash = index (prefix,"/");
				 while (islash>0){
					islash++;
					prefix = substr (prefix,islash);
					#print prefix
					islash = index (prefix,"/");
					#print prefix
				}

		#print prefix
	}
		
		
	prefix1=prefix
	i_start=$1/target_rate
	i_end=$2/target_rate
	int_s=int(i_start)
	int_e=int(i_end)
	if((int_e-int_s)>3)
	if ($3==phone){
		print prefix1"_"phone"_"int_s"_"int_e".mfc="pref_mfc".mfc["int_s","int_e"]" 
	}	
		#print phone
		#print prefix1
	#print $0	 	
	#print phone
	#print prefix
				
}
