source env_cygwin.sh

dir=hmm7
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
penalty=-p -0.0 -s 5.0 
cmd="$HTKTOOLS_DIR/HVite $penalty  -l $outdir -y recw  -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite $penalty   -i recw.mlf -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

 
