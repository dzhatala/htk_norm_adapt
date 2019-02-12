sync
source env_cyg_mfcc_pca.sh
HVITE=$HTKTOOLS_DIR/HVite
prefix=mfcc_pca
mkdir -p hmm0_$prefix_$prefix
init_name=initial_0_D_A
#init_name=initial_PCA10
cp hinitoutput/$init_name hmm0_$prefix/
echo "ubuntu listing phonems from $labdir "
awk '{
	print $3
	
}'  $labdir/*.lab | sort | uniq > phonems.lst   #change lab file here, to include all use $labdir/*.lab
#lab_files=$labdir/*.lab ; 
#echo $lab_files ; read
echo "ENTER " ; read
cp /dev/null hmm0_$prefix/hmmdefs
for x in `cat phonems.lst`
do
	echo "creating hmm $x from  $init_name "
	cat hmm0_$prefix/$init_name | sed s/$init_name/$x/ >> hmm0_$prefix/hmmdefs
done

#head -3 hmm0_$prefix/proto > hmm0_$prefix/macros ; head -3 hmm0_$prefix/vFloors >> hmm0_$prefix/macros ; read

prune_param="50.0 150.0 1000.0"
mkdir -p hmm1_$prefix
echo creating hmms in hmm1_$prefix ... 
cmd="$HTKTOOLS_DIR/HERest -T 7 -L $labdir -C configtrain_mfcc_pca.txt  -t $prune_param \
-S train.lst  -H hmm0_$prefix/hmmdefs -M hmm1_$prefix phonems.lst"
echo $cmd ; eval $cmd

echo [ENTER!]
read 

mkdir -p hmm2_$prefix
echo creating hmms in hmm2_$prefix ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain_mfcc_pca.txt  -t $prune_param \
-S train.lst  -H hmm1_$prefix/hmmdefs -M hmm2_$prefix phonems.lst"
echo $cmd ; eval $cmd

mkdir -p hmm3_$prefix
echo creating hmms in hmm3_$prefix ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain_mfcc_pca.txt  -t $prune_param \
-S train.lst  -H hmm2_$prefix/hmmdefs -M hmm3_$prefix phonems.lst"
echo $cmd ; eval $cmd

mkdir -p hmm4_$prefix
cp -r hmm3_$prefix/* hmm4_$prefix
#cat master_sp.txt >> hmm4_$prefix/hmmdefs
#echo "Please fix sp.state2 using sil.state3 on hmm4_$prefix/hmmdefs <ENTER>! " ;read
mkdir -p hmm5_$prefix
echo "Creating monophones1.tmp from phones.lst "
cat phonems.lst > monophones1.tmp
#echo sp >> monophones1.tmp
sort monophones1.tmp | uniq | sort > monophones1

cmd="$HTKTOOLS_DIR/HHEd -T 1  -H hmm4_$prefix/hmmdefs -M hmm5_$prefix sil_mix.hed monophones1"
echo $cmd ; eval $cmd

read

mkdir -p hmm6_$prefix
echo creating hmms in hmm6_$prefix ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain_mfcc_pca.txt  -t $prune_param \
-S train.lst  -H hmm5_$prefix/hmmdefs -M hmm6_$prefix monophones1"
echo $cmd ; eval $cmd

read 
mkdir -p hmm7_$prefix
echo creating hmms in hmm7_$prefix ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain_mfcc_pca.txt  -t $prune_param \
-S train.lst  -H hmm6_$prefix/hmmdefs -M hmm7_$prefix monophones1"
echo $cmd ; eval $cmd


