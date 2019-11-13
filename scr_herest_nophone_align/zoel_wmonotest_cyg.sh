source env_cyg_titml_idn.sh

phonems=monophones_zoel
 

#adaptation version 
#cp ../
ftest="-S ../scr_pdp1819_mono_good_001/train.lst"
ftest="-S zoel_test.lst"

fconfig="configtrain.txt"
if [ "$1" != "" ]; then
	ftest=""
	datafiles=$@
	fconfig="config_test_htk.txt"
fi

dict="zoel_mono.dict"
cmd="HVite -T 1 -H zoel_hmm17/hmmdefs $ftest -l '*' \
-J zoel_hmm16 -J zoel_classes -i zoel_rec.mlf -w cwords.net \
-C $fconfig -p 0.0 -s 1.0 $dict $phonems $datafiles"
echo $cmd; eval $cmd ; 
#echo ENTER ; read
