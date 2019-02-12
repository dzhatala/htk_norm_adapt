source env_cyg_mfcc_pca.sh

dir=hmm12_mfcc_pca
phonems=triphones1_srtd
dict=p3_dict.txt
ftest=test.lst

cp /dev/null $dict ;sync

awk '{
	if (index($0,"sp")>0){
		#print "sil\tsp"
	}else
	print $1,"\t",$1 
	
}' $phonems > $dict

sync

rm -f phone3.net
cmd="$HTKTOOLS_DIR/HBuild $dict phone3.net"
echo $cmd ; eval $cmd

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf
cmd="$HTKTOOLS_DIR/HVite  -l $outdir -y pca  -T 1  -w phone3.net -C config_test_htk_mfcc_pca.txt  -H $dir/hmmdefs \
 -o S   $dict $phonems $@"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w cwords.net -C configtrain_mfcc_pca.txt  -H $dir/hmmdefs \
 -o S -S ctest.lst $dict $phonems"
#echo $cmd ; eval $cmd

 
