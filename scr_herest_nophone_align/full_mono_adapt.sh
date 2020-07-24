sync
#read
source env_cyg_titml_idn.sh
echo using prefix $titml_prefix
#for x in `cat monophones1_full.txt`
out_dir=full_herest_out_step_8
rm -f $out_dir/*
mkdir -p $out_dir
train_lst=x240_train.lst
source_hmm=full_hrest_out/hmmdefs
#use_mlf=-I adaptPhones.mlf
use_mlf="-L gen_lab"

mkdir -p full_herest_out/04 classes
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $prune $use_mlf    \
	   -H full_herest_out/03/hmmdefs -M full_herest_out/04 -s mono_stats monophones1_full.txt"
#echo $cmd ; eval $cmd
#echo ENTER ; read

cmd="$HTKTOOLS_DIR/HHEd -B -H full_herest_out/04/hmmdefs  -M classes regtree.hed monophones1_full.txt"
#echo $cmd ; eval $cmd
#echo ENTER ; read


mkdir -p xforms

cmd="$HTKTOOLS_DIR/HERest -T 7 -C configtrain.txt -C config.semi -S adapt.scp $use_mlf \
 -u stw  -H full_herest_out/04/hmmdefs  -K xforms mllr1 -J classes  -z x.tmf  -h '*/m1*.mfc' -M tmp monophones1_full.txt"
#echo $cmd ; eval $cmd
#echo ENTER ; read


cmd="$HTKTOOLS_DIR/HERest -T 7 -C configtrain.txt -C config.global -S adapt.scp $use_mlf \
 -u a  -H full_herest_out/03/hmmdefs  -K xforms mllr1 -J classes  -z x.tmf  -h '*/m1*.mfc' -M tmp monophones1_full.txt"
#echo $cmd ; eval $cmd
#echo ENTER ; read

mkdir -p hmm16
cp x240_m11_test.lst adapt.scp
cmd="$HTKTOOLS_DIR/HERest -T 1 -C configtrain.txt -C config.semi -S adapt.scp -L gen_lab -u stw \
-H full_herest_out/04/hmmdefs   -h '*/m11*.mfc' -J classes \
-K HMM16 -M hmm16 monophones1_full.txt"
echo $cmd ; eval $cmd ;echo ENTER ; read


mkdir -p hmm17
cmd="$HTKTOOLS_DIR/HERest -T 1 -C configtrain.txt  -S adapt.scp -L gen_lab -u tmvw \
-H hmm16/hmmdefs   -h '*/m11*.mfc' -J classes -J hmm16 \
 -M hmm17 monophones1_full.txt"
#echo $cmd ; eval $cmd ; echo ENTER ; read

