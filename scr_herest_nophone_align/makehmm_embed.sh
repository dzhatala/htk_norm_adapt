source env_cyg_titml_idn.sh
sync
echo using datadir=$datadir ; read

mkdir -p hmm1embedd

cmd="$HTKTOOLS_DIR/HERest  -T 1 -C configtrain.txt -L $lab_ph_no_time_dir -s stats \
-S train_embedd.lst  -H hmm0viterbi/hmmdefs -M hmm1embedd monophones1"
echo $cmd ; eval $cmd
