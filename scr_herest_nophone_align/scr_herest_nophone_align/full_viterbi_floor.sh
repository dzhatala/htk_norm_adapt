sync
source env_cyg_titml_idn.sh
init_file=initial_0_D_A_6
out_dir=fullhinit_out
mkdir -p $out_dir
cmd="$HTKTOOLS_DIR/HInit -T 1  -C configtrain.txt $trace_flag -m 1 -M $out_dir $init_file -S tala_train.lst"
echo $cmd ; eval $cmd
