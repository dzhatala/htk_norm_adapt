sync
source env_cygwin.sh
typePrefix=viterbi
HVITE=$HTKTOOLS_DIR/HVite
rm -f hmm0$typePrefix/*
mkdir -p hmm0$typePrefix
echo "ubuntu listing phonems from $labdir "

#awk '{
#	print $3
#	
#}'  $labdir/*.lab | #sort | #uniq > phonems.lst   #change lab file here, to include all use $labdir/*.lab

cat phonems.lst
#lab_files=$labdir/*.lab ; 
#echo $lab_files ; read
echo "ENTER " ; read
cp /dev/null hmm0$typePrefix/hmmdefs

trace_flag="-T 511"
trace_flag="-T 11"
init_file=initial_0_D_A
for x in `cat phonems.lst`
#for x in sil
do
	cmd="./create_viterbi_script.sh $x"
	#uncomment to recrate train list for HInit
	#echo $cmd ; eval $cmd;
	
	cmd="$HTKTOOLS_DIR/HInit -T 1  -C configtrain.txt $trace_flag -m 1 -M hinitoutput $init_file -S viterbi_train_$x.lst"
	echo $cmd ; eval $cmd
	init_name=initial_0_D_A
	echo "creating hmm $x from  $init_name "
	cp hinitoutput/$init_name hmm0$typePrefix/
	
	cat hmm0$typePrefix/$init_name | sed s/$init_name/$x/ >> hmm0$typePrefix/$x
	cat hmm0$typePrefix/$init_name | sed s/$init_name/$x/ >> hmm0$typePrefix/hmmdefs
	echo "ENTER " ; read


done

