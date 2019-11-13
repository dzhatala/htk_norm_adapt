source env_cyg_titml_idn.sh

phonems=monophones_zoel
 

#adaptation version 
#cp ../
ftest="-S ../scr_pdp1819_mono_good_001/train.lst"
ftest="-S zoel_test.lst"
fconfig="configtrain.txt"
hmms="-H zoel_hmm17/hmmdefs -J zoel_hmm16 SEMITIED -J zoel_classes"
ftest=""   #live audio
fconfig="configlive.txt -g"
#hmms="-H hmm1/hmmdefs"
hmms="-H zoel_hmm17/hmmdefs -J zoel_hmm16 -J zoel_classes"

if [ "$1" != "" ]; then
	ftest=""
	datafiles=$@
	fconfig="config_test_htk.txt"
fi

HVite=HVite
HVite="/cygdrive/f/rsync/RESEARCHS/htk/softs_tools/open-speech-github_HTK-r3.4.1_fix/HTK-r3.4.1_fix/HTKTools/HVite"

dict="zoel_mono.dict"
cmd="$HVite -T 1  $ftest -l '*' \
 $hmms -i zoel_rec.mlf -w cwords.net \
-C $fconfig -p 0.0 -s 1.0 $dict $phonems $datafiles"
echo $cmd; eval $cmd ; 
#echo ENTER ; read
