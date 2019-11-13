source env_cyg_titml_idn.sh
echo "datadir $datadir"
echo "labdir $labdir"
echo "Enter " ; read
echo "wait ... " 

#find ../../../small_vocabulary_/datas/TITML-IDN/Speech -name m09* -or -name m10* > x240_test_wav.lst
find ../../../small_vocabulary_/datas/TITML-IDN/Speech  -name m11* > x240_test_wav.lst


awk '{
		print $0 "\t" substr($0,1,length($0)-3) "mfc"
	}
	' x240_test_wav.lst >  wav2mfcc_cyg.lst
sync ; sleep 2; echo "train.lst created for TITML-IDN"		

echo "completed"
