source env_cygwin.sh
prefix=PCA

dir=hmm7_$prefix
phonems=monophones1
dict=phone1.dic
ftest=train_pca.lst
 
cp /dev/null $dict ;sync

awk '{
	if (index($0,"sp")>0){
		#print "sil\tsp"
	}else
	print $1,"\t",$1 
	
}' $phonems > $dict

sync
#echo "test" ; read

$HTKTOOLS_DIR/HBuild $dict phone.net
outdir="../../wavs/results"
mkdir -p $outdir		# outdir in env.sh
cmd="$HTKTOOLS_DIR/HVite  -i recph.mlf -T 1 -w phone.net -C config_train_pca.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd
#omit -i so individual label will be created
cmd="$HTKTOOLS_DIR/HVite -l $outdir  -y phpc -T 1 -w phone.net -C config_train_pca.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

date
