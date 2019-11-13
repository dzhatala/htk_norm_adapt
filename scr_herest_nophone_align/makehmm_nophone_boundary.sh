sync
source env_cygwin.sh
echo "using datadir $datadir"
HVITE=$HTKTOOLS_DIR/HVite
sort phonems.lst | uniq | sort | uniq > monophones1

mkdir -p hmm_herestout
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S train_no_phone.lst -T 7 -L $labdir/no_boundary    \
	   -H hmm1/hmmdefs -M hmm_herest_out $monophones1 monophones1"
	echo $cmd ; eval $cmd
