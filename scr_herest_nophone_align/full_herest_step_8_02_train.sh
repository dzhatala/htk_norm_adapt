sync
source env_cyg_titml_idn.sh
echo using prefix $titml_prefix
#for x in `cat monophones1_full.txt`
out_dir=full_herest_out_step_8
rm -f $out_dir/*
mkdir -p $out_dir
train_lst=x240_train.lst
source_hmm=full_hrest_out/hmmdefs
#use_mlf=-I full_aligned.mlf
use_mlf="-L gen_lab"

mkdir -p full_herest_out/01
mkdir -p full_herest_out/02
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $use_mlf    \
	   -H $source_hmm -M full_herest_out/01 monophones1_full.txt"
#echo $cmd ; eval $cmd

cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $use_mlf    \
	   -H full_herest_out/01/hmmdefs -M full_herest_out/02 monophones1_full.txt"
#echo $cmd ; eval $cmd

#prune="-t 250.0"
mkdir -p full_herest_out/03
	for x in 3 4 5 6 7 8 9
	do
		cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $prune $use_mlf    \
			   -H full_herest_out/02/hmmdefs -M full_herest_out/03 monophones1_full.txt"
		echo $cmd ; eval $cmd
		cmd="cp full_herest_out/03/hmmdefs full_herest_out/02/hmmdefs"
		echo $cmd ; eval $cmd;
		sync ; sleep 1;
	done
