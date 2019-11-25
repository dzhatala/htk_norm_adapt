source env_cygwin.sh
mkdir -p hinitoutput
trace_flag="-T 1"
init_file=initial_0_D_A
cmd="$HTKTOOLS_DIR/HInit -T 1  -C configtrain.txt $trace_flag -m 1 -M hinitoutput $init_file -S zoel_tb.lst"
echo $cmd ; eval $cmd
echo "initialized in hinitoutput/$init_file"
