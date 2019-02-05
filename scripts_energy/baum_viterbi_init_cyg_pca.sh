
#gdb  -cd=../../neural_network_shmm/htk_35/HTKTools HInit
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 40 -m 1 -M hinitoutput VOI arctic_a0001.mfc"
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 40 -m 1 -M hinitoutput FULL_VOI arctic_a0001.mfc"

#T_OBP
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 400 -m 1 -M hinitoutput FULL_VOI arctic_a0001.mfc"
#T_ALL, all logg 511
source env_cygwin.sh
#ls $datadir/*.mfc > train.lst && sync
mkdir -p hinitoutput
trace_flag="-T 511"
trace_flag="-T 11"
init_file=initial_0_D_A
init_file=initial_PCA
cmd="$HTKTOOLS_DIR/HInit -T 1  -C config_train_pca.txt $trace_flag -m 1 -M hinitoutput $init_file -S train_pca.lst"
echo $cmd ; eval $cmd
echo "initialized in hinitoutput/$init_file"
