source env_cyg_mfcc_pca.sh

dir=hmm12_mfcc_pca
#dir=hmm12_TS_mfcc_pca
phonems=triphones1_srtd
dict=cdict.txt
ftest=test.lst

rm -f words.net
cmd="$HTKTOOLS_DIR/HParse -T 1 wgram_cont.txt cwords.net"
echo $cmd ; eval $cmd
cat wgram_cont.txt

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf
ps="-p -0.0 -s 1.0"
cmd="$HTKTOOLS_DIR/HVite  $ps -l $outdir -y rmp  -T 1  -w cwords.net -C config_test_htk_mfcc_pca.txt  -H $dir/hmmdefs \
 -o S   $dict $phonems $@"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w cwords.net -C configtrain_mfcc_pca.txt  -H $dir/hmmdefs \
 -o S -S ctest.lst $dict $phonems"
#echo $cmd ; eval $cmd

 
