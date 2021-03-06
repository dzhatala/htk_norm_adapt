source env_cygwin.sh
sync
echo using datadir=$datadir ; read

#echo aligning...?
#echo fix words.mlf ! [ENTER] ; read
#@TODO uatomatically create words.mlf
#  ../htk/HTKTools/HVite -T 1 -l '*' -I words.mlf -o SW -C config -a -H hmm7_$prefix/macros \
# -H hmm7_$prefix/hmmdefs  -i aligned.mlf -L $datadir -y lab \
#  -S train.scp phone1.dic monophones1

echo Press key  !;  read

echo mktri

 
prefix=cyg
echo "hmm9_$prefix"
mkdir -p hmm9_$prefix
 
cp hmm7_$prefix/* hmm9_$prefix/

#creating hmm list for triphones1 will be used in mktri.hed ...
#echo "creating triphones1 ..."
#cmd="./mktrilab.sh"
#echo $cmd ; eval $cmd
#echo Press key  !;  read
#cat triphones1 > triphones1.delay.txt
#ping localhost > /dev/null ; sync  
#cut -f 3 -d " " ../trilab/*lab | sort | uniq > triphones1 ; 
#ping localhost > /dev/null ; sync  


 
echo "hmm10_$prefix..."
mkdir -p hmm10_$prefix
cmd="$HTKTOOLS_DIR/HHEd   -H hmm9_$prefix/hmmdefs -M hmm10_$prefix TS_mktri.hed monophones1"
echo $cmd ; eval $cmd 
echo "ENTER!" ; read



 
echo "hmm11_$prefix..."
mkdir -p hmm11_$prefix
trilab=""
trilab="-L ../wavs/trilab"

cmd="cp train.lst mfc_triph.scp"
echo $cmd ; eval $cmd

prune_param="50.0 150.0 1000.0"
fconfig=configtrain_mfcc_pca.txt
cmd="$HTKTOOLS_DIR/HERest  -T 1 -C $fconfig $trilab $prune -s stats \
-S mfc_triph.scp  -H hmm10_$prefix/hmmdefs -M hmm11_$prefix triphones1"
echo $cmd ; eval $cmd
echo Press key  !;  read

echo "hmm12_$prefix..."
mkdir -p hmm12_$prefix
cmd="$HTKTOOLS_DIR/HERest  -T 1 -C $fconfig $trilab $prune -s stats \
-S mfc_triph.scp  -H hmm11_$prefix/hmmdefs -M hmm12_$prefix triphones1"
echo $cmd ; eval $cmd





cp cdict.txt mono_dict.txt

echo "creating 3 dict"
cmd="$HTKTOOLS_DIR/HDMan -T 1 -b sil  -n fulllist -g global.ded -l flog beep-tri mono_dict.txt"
echo $cmd ; eval $cmd  ; echo "ENTER!" ; read

mkdir -p hmm13_$prefix
cmd="$HTKTOOLS_DIR/HHEd -B  -H hmm12_$prefix/hmmdefs -M hmm13_$prefix tree.hed triphones1"
echo $cmd ; eval $cmd 
echo "ENTER" ; read

mkdir  -p hmm14_$prefix
cmd="$HTKTOOLS_DIR/HERest  -T 1 -C $fconfig $trilab $prune -s stats \
-S mfc_triph.scp  -H hmm13_$prefix/hmmdefs -M hmm14_$prefix triphones1"
echo $cmd ; eval $cmd

mkdir  -p hmm15_$prefix
cmd="$HTKTOOLS_DIR/HERest  -T 1 -C $fconfig $trilab $prune -s stats \
-S mfc_triph.scp  -H hmm14_$prefix/hmmdefs -M hmm15_$prefix triphones1"
echo $cmd ; eval $cmd



phones=tiedlist
echo "Adding sp"
cp hmm15_$prefix/hmmdefs hmm15_$prefix/temp
./fix_sil_sp.awk hmm15_$prefix/temp >> hmm15_$prefix/hmmdefs
echo sp >> $phones