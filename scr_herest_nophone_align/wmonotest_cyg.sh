#source env_cygwin.sh
source env_cyg_titml_idn.sh
#dir=hmm1
#phonems=monophones1
#dict=mono_dict.txt

dir=full_herest_out/03
phonems=monophones1_full.txt
dict=dict_full
gram=wnet_full
gram=LM/holmes.0/gram.0
gram=bigfn
gram=LM/word_bg_net
ftest=x240_test.lst
wlabdir=../../wavs/wlabgen


#ftest=ctest.lst
#gram=wgram_isol.txt
#gram=wgram_cont.txt

#rm -f words.net
#cmd="$HTKTOOLS_DIR/HParse $gram words.net"
#echo $cmd ; eval $cmd



#where to put world labs
#outdir="wlabdir"
mkdir -p $outdir
rm -f recw.mlf
#penalty="-p -0.0 -s 5.0"
#cmd="$HTKTOOLS_DIR/HVite $penalty  -l $outdir -y recw  -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
# -o S -S $ftest $dict $phonems"
#echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite $penalty   -i recw.mlf -T 1  -w $gram -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
#echo $cmd ; eval $cmd

echo Adaptation version...
cmd="HVite -T 1 -H hmm17/hmmdefs -S x240_m11_test.lst -l '*' \
-J hmm16 -J classes -i hmm17_recph.mlf -w LM/word_bg_net \
-C configtrain.txt -p 0.0 -s 5.0 dict_full monophones1_full.txt"
echo $cmd; eval $cmd ; echo ENTER ; read

 
