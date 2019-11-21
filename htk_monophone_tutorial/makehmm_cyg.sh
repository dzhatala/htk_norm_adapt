sync
source env_cygwin.sh
HVITE=$HTKTOOLS_DIR/HVite
rm -f hmm0/*
mkdir -p hmm0
init_name=initial_0_D_A
cp hinitoutput/$init_name hmm0/
echo "ubuntu listing phonems from $labdir "
awk '{
	print $3
	
}'  $labdir/*.lab | sort | uniq > phonems.lst   #change lab file here, to include all use $labdir/*.lab
sort phonems.lst | uniq | sort | uniq > monophones1
#lab_files=$labdir/*.lab ; 
#echo $lab_files ; read
echo "ENTER " ; read
cp /dev/null hmm0/hmmdefs

for x in `cat phonems.lst`
do
	echo "creating hmm $x from  $init_name "
	cat hmm0/$init_name | sed s/$init_name/$x/ >> hmm0/$x
	cat hmm0/$init_name | sed s/$init_name/$x/ >> hmm0/hmmdefs
done

#head -3 hmm0/proto > hmm0/macros ; head -3 hmm0/vFloors >> hmm0/macros ; read
echo "echo are phonems in phonems.lst correct ?" ; read

prune_param=" -t 50.0 150.0 1000.0"
mkdir -p hmm1
echo creating hmms in hmm1 ... 
counter=1
for x in `cat phonems.lst`
do
	cmd="$HTKTOOLS_DIR/HRest -C configtrain.txt -S zoel_tb.lst -T 1 -L $labdir    \
	   -M hmm1 -l $x hmm0/$x"
	#cmd="$HTKTOOLS_DIR/HRest "
	echo $cmd ; eval $cmd
	if [ "$counter" == "1" ]; then 
		if [ -f hmm1/$x ]; then
			#cp /dev/null hmm0/hmmdefs
			cp hmm1/$x hmm1/hmmdefs
			echo "##ALL"
		fi
	else
		if [ -f hmm1/$x ]; then
			tail -n +4 hmm1/$x >>  hmm1/hmmdefs
			echo "##head ignored"
		fi
	fi
	counter=`expr $counter + 1`; echo "$counter $x"

	echo [ENTER! CONT ]   CTRL+C EXIT!
	read 
done
