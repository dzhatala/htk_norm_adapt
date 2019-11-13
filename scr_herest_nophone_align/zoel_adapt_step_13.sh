sync
source env_cyg_titml_idn.sh
use_mlf="-L gen_lab"
echo "hereset using full monophones ... "
mkdir -p full_herest_out/05 classes
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $prune $use_mlf    \
	   -H full_herest_out/04/hmmdefs -M full_herest_out/05 -s full_herest_out/mono_stats monophones1_full.txt"
#echo $cmd ; eval $cmd
mkdir -p full_herest_out/06
#cp full_herest_out/05/* full_herest_out/06/


mkdir -p hmm15 classes
mkdir -p full_herest_out/05 classes
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $prune $use_mlf    \
	   -H full_herest_out/04/hmmdefs -M hmm15 -s hmm15/mono_stats monophones1_full.txt"
#echo $cmd ; eval $cmd
#echo ENTER ; read

cmd="HHEd  -T 1 -H hmm15/hmmdefs -M classes regtree.hed \
monophones1_full.txt"
echo $cmd ; eval $cmd

#uncomment if zoel_mono.dict.0 is changed
#cut -f 1 zoel_mono.dict.0 -d$'\t' | sort | uniq > wlist; sync ; sleep 1 ; echo PLEASE SORT wlist !!!; read
cmd="HDMan -T 1 -m -w wlist -g /dev/null -n monophones_zoel -l dlog zoel_mono.dict zoel_mono.dict.0"
echo $cmd ; eval $cmd ;echo "monophones filtered into monophones_zoel"; echo ENTER ; read;

echo "mllr1 ..."
cmd="HERest -T 1 -C configtrain.txt -C config.global \
-S zoel_train.lst  -I zoel_adapt.mlf \
 -H hmm15/hmmdefs -u a   -K xforms mllr1 -J classes \
-h '*.mfc' monophones_zoel"
echo $cmd ; eval $cmd

echo "mllr2 ..."
cmd="HERest -T 1 -a -C configtrain.txt -C config.rc \
-S zoel_train.lst -I zoel_adapt.mlf \
 -H hmm15/hmmdefs -u a  -J xforms mllr1 -K xforms mllr2 \
-J classes -h '*.mfc' monophones_zoel"
echo $cmd ; eval $cmd

#recognition
cmd="HVite -T 1 -H hmm15/hmmdefs -S zoel_test.lst -l '*' \
-J xforms mllr2 -h '*.mfc' -k -i recoutAdapt.mlf -w cwords.net \
-J classes -C configtrain.txt -p 0.0 -s 5.0 zoel_mono.dict monophones_zoel"
#echo $cmd ; eval $cmd
