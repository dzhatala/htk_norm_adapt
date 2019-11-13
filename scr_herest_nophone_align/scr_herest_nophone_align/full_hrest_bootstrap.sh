sync
source env_cyg_titml_idn.sh
#for x in `cat monophones1_full.txt`
out_dir=full_hrest_out
mkdir -p full_hrest_out
source_file=initial_0_D_A_6
source_hmm=fullhinit_out/$source_file

if [ "do" == "notdo" ]; then 
	for one_label in `cat monophones1_a_w.txt`
	do
		cmd="$HTKTOOLS_DIR/HRest -i 50 -C configtrain.txt -S train_hrest_a_w.lst -T 1 -L $labdir    \
		   -M $out_dir -l $one_label $source_hmm"
		#echo $cmd ; eval $cmd
		cp $out_dir/$source_file $out_dir/$one_label
		echo output at $out_dir/$one_label ; echo [ENTER!]
		read 
	done
fi
 
if [ "do" == "dont" ]; then 
	for one_label in au oi y
	do
		cmd="$HTKTOOLS_DIR/HRest -i 50 -C configtrain.txt -S train_hrest_au_y.lst -T 1 -L $labdir    \
		   -M $out_dir -l $one_label $source_hmm"
		echo $cmd ; eval $cmd
		cp $out_dir/$source_file $out_dir/$one_label
		echo output at $out_dir/$one_label
		echo [ENTER!]
		read 
	done
fi
