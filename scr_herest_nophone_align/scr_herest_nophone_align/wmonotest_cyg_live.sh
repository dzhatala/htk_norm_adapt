source env_cygwin.sh

dir=hmm1
phonems=monophones1
dict=mono_dict.txt
ftest=ctest.lst

gram=wgram_isol.txt
gram=wgram_cont.txt
rm -f words.net
cmd="$HTKTOOLS_DIR/HParse $gram words.net"
echo $cmd ; eval $cmd

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf
cmd="$HTKTOOLS_DIR/HVite    -T 1  -w words.net -C configlive.txt  -H $dir/hmmdefs \
 -o S -g $dict $phonems"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
#echo $cmd ; eval $cmd

 
