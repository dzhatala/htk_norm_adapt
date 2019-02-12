source env_cygwin.sh

prefix=PCA
dir=hmm12_$prefix
phonems=triphones1_srtd
dict=cdict.txt
#dict=mono_dict.txt
ftest=train_pca.lst

rm -f words.net
cmd="$HTKTOOLS_DIR/HParse -T 1 wgram_cont.txt cwords.net"
echo $cmd ; eval $cmd

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf

penalty="-p 0.0 -s 1.0"
cmd="$HTKTOOLS_DIR/HVite  -l $outdir -y recw  -T 1 $penalty -w cwords.net -C config_train_pca.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1 $penalty  -w cwords.net -C config_train_pca.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

 
