source env_cygwin.sh

#HRest Outputs
dir=hmm1
phonems=phonems.lst
dict=words.dict
ftest=zoel_tb.lst
outdir=results

 
cmd="$HTKTOOLS_DIR/HParse words.gram words.net"
echo $cmd ; eval $cmd
mkdir -p $outdir		#
cmd="$HTKTOOLS_DIR/HVite  -i recph.mlf -T 1 -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd
#omit -i so individual label will be created
cmd="$HTKTOOLS_DIR/HVite -l $outdir  -y recph -T 1 -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

