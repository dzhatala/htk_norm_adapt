sync
source env_cyg_titml_idn.sh
echo using prefix $titml_prefix
#for x in `cat monophones1_full.txt`
out_dir=full_herest_out_step_8
rm -f $out_dir/*
mkdir -p $out_dir
train_lst=x240_train.lst
source_hmm=full_hrest_out/hmmdefs
dict=$titml_prefix/zoel_stats/htk/titml_idn.dict
word_lab=$titml_prefix/zoel_stats/htk/wd_no_time/verified
#word_lab=$titml_prefix/zoel_stats/htk/wd_no_time/m01
#prune="-t 250.0"
cp $dict dict_full
echo "SILENCE	sil" >> dict_full
echo "SILENCE	NNN" >> dict_full
cat $titml_prefix/zoel_stats/htk/add_fixed.dict >> dict_full
sort dict_full |  uniq > tmp.dict ;sync ; sleep 1
cp tmp.dict dict_full
trainf=now.lst
#trainf=x240_train.lst
#use_mlf=-i full_aligned.mlf
use_mlf="-l gen_lab"
mkdir -p gen_lab
cmd="$HTKTOOLS_DIR/HVite -T 1 -l '*' -o SWT   -C configtrain.txt -a -H full_hrest_out/hmmdefs \
	$use_mlf -m $prune -y lab \
	-L $word_lab -S $trainf dict_full monophones1_full.txt"
echo $cmd ; eval $cmd

