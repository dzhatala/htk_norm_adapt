sync
source env_cyg_titml_idn.sh
#for x in `cat monophones1_full.txt`
out_dir=full_hrest_out
rm -f $out_dir/*
mkdir -p full_hrest_out
source_file=initial_0_D_A_6
source_hmm=fullhinit_out/$source_file

mkdir -p tmp
cp /dev/null $out_dir/hmmdefs
counter=1

if [ "do" == "do" ]; then 
	for one_label in `cat monophones1_a_w.txt`
	do
		init_name=$source_file
		echo "creating hmm $one_label from  $source_hmm "
		cat $source_hmm | sed s/$source_file/$one_label/ > tmp/$one_label
		cmd="$HTKTOOLS_DIR/HRest -i 50 -C configtrain.txt -S train_hrest_a_w.lst -T 1 -L $labdir    \
		   -M $out_dir -l $one_label tmp/$one_label"
		echo $cmd ; eval $cmd
		#cp $out_dir/$source_file $out_dir/$one_label
		echo output at $out_dir/$one_label

		if [ "$counter" == "1" ]; then 
			if [ -f $out_dir/$one_label ]; then
				#cp /dev/null hmm0/hmmdefs
				cp $out_dir/$one_label $out_dir/hmmdefs
				echo "	##new hmmdefs"
			fi
		else
			if [ -f $out_dir/$one_label ]; then
				tail -n +4 $out_dir/$one_label >>  $out_dir/hmmdefs
				echo "	##head ignored for $one_label"
			fi
		fi
		counter=`expr $counter + 1`; echo "	##Num hmm counter : $counter"

		echo [ENTER!] ; 		read 
	done
fi
 
if [ "do" == "do" ]; then 
	for one_label in au oi y
	do
		init_name=$source_file
		echo "creating hmm $one_label from  $source_hmm "
		cat $source_hmm | sed s/$source_file/$one_label/ > tmp/$one_label
		cmd="$HTKTOOLS_DIR/HRest -i 50 -C configtrain.txt -S train_hrest_au_y.lst -T 1 -L $labdir    \
		   -M $out_dir -l $one_label tmp/$one_label"
		echo $cmd ; eval $cmd
		#cp $out_dir/$source_file $out_dir/$one_label
		echo output at $out_dir/$one_label

		if [ "$counter" == "1" ]; then 
			if [ -f $out_dir/$one_label ]; then
				#cp /dev/null hmm0/hmmdefs
				cp $out_dir/$one_label $out_dir/hmmdefs
				echo "	##new hmmdefs"
			fi
		else
			if [ -f $out_dir/$one_label ]; then
				tail -n +4 $out_dir/$one_label >>  $out_dir/hmmdefs
				echo "	##head ignored for $one_label"
			fi
		fi
		counter=`expr $counter + 1`; echo "	##Num hmm counter : $counter"

		echo [ENTER!] ; 		read 
	done
fi

if [ "do" == "do" ]; then 
	for one_label in kh sy z
	do
		init_name=$source_file
		echo "creating hmm $one_label from  $source_hmm "
		cat $source_hmm | sed s/$source_file/$one_label/ > tmp/$one_label
		cmd="$HTKTOOLS_DIR/HRest -i 50 -C configtrain.txt -S train_hrest_kh_z.lst -T 1 -L $labdir    \
		   -M $out_dir -l $one_label tmp/$one_label"
		echo $cmd ; eval $cmd
		#cp $out_dir/$source_file $out_dir/$one_label
		echo output at $out_dir/$one_label

		if [ "$counter" == "1" ]; then 
			if [ -f $out_dir/$one_label ]; then
				#cp /dev/null hmm0/hmmdefs
				cp $out_dir/$one_label $out_dir/hmmdefs
				echo "	##new hmmdefs"
			fi
		else
			if [ -f $out_dir/$one_label ]; then
				tail -n +4 $out_dir/$one_label >>  $out_dir/hmmdefs
				echo "	##head ignored for $one_label"
			fi
		fi
		counter=`expr $counter + 1`; echo "	##Num hmm counter : $counter"

		echo [ENTER!] ; 		read 
	done
fi
