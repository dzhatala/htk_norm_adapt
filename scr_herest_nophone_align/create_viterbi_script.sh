y1="./train.lst"

phone=$1
cp /dev/null viterbi_train_$phone.lst

if [ "$phone" != "" ]; then

	for mfcs in `cat $y1`
	do
		#echo $mfcs ; read
		#this awk portion get the basename of file
		#  stripout .mfc ext and its parent dir 
		p1=`echo $mfcs | awk '{
				
				#print $0;
				i1 = index ($1,".mfc");
				prefix=substr($1,1,i1-1);
				islash = index (prefix,"/");
				datadir=prefix; print datadir
				#print datadir
				 while (islash>0&&0){
					islash++;
					prefix = substr (prefix,islash);
					islash = index (prefix,"/");
				}
				#print prefix 
			}
		'`
		
		
		
		#this line must exist or awk print nothing
		lab="$p1.lab"
		#echo $lab
		cmd="awk -f  create_viterbi_script_003.awk 'phone=$phone' 'target_rate=100000'  $lab"
		echo $cmd ; eval $cmd >> viterbi_train_$phone.lst

		done
else
	echo "usage: create_viterbi_script.sh phone_name"
fi
