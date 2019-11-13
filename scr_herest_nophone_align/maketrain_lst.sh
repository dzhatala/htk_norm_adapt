#source env_cygwin.sh
#source env_cyg_mfcc_pca.sh
source env_cyg_titml_idn.sh
echo "datadir $datadir"
echo "labdir $labdir"
echo "Enter " ; read
echo "wait ... " 

ls $labdir/*.lab | sort -r > all_train.lab ; 
sync ; sleep 2; echo lab list in all_train.lab

awk '{
		#print $0;
		n=split($0,a,"/praat/male/")
		print a[1] "/Speech/"  substr(a[2],1,3) "/" substr(a[2],1,length(a[2])-3) "wav" "\t" substr($0,1,length($0)-3) "mfc"
	}
	' all_train.lab > wav2mfcc_cyg.lst
sync ; sleep 2; echo "wav2mfcc_cyg.lst created for TITML-IDN"		
#for x in `ls $labdir/*.lab`
#do 
#	y=`echo $x | sed s/lab/mfc/`
#	echo "$y"
#done  > train_slow.lst

awk '{
		print substr($0,1,length($0)-3) "mfc"
	}
	' all_train.lab > train.lst
sync ; sleep 2; echo "train.lst created for TITML-IDN"		

cp train.lst test.lst
cp train.lst ctest.lst
echo "completed"
