source env_cygwin.sh

#HRest Outputs
dir=hmm1
phonems=phonems.lst
dict=phone1.dic
ftest=zoel_tb.lst
outdir=results
 
cp /dev/null $dict ;sync

awk '{
	if (index($0,"sp")>0){
		#print "sil\tsp"
	}else
	print $1,"\t",$1 
	
}' $phonems > $dict

sync

$HTKTOOLS_DIR/HBuild $dict phone.net
mkdir -p $outdir		#
cmd="$HTKTOOLS_DIR/HVite  -i recph.mlf -T 1 -w phone.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd
#omit -i so individual label will be created
cmd="$HTKTOOLS_DIR/HVite -l $outdir  -y recph -T 1 -w phone.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

