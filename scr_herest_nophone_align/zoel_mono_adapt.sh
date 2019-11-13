sync
source env_cyg_titml_idn.sh
use_mlf="-L gen_lab"
echo "hereset using full monophones ... "
mkdir -p full_herest_out/05 classes
cmd="$HTKTOOLS_DIR/HERest -C configtrain.txt -S x240_train.lst -T 1 $prune $use_mlf    \
	   -H full_herest_out/04/hmmdefs -M full_herest_out/05 -s mono_stats monophones1_full.txt"
mkdir -p full_herest_out/06
cp full_herest_out/05/hmmdefs full_herest_out/06/
#echo $cmd ; eval $cmd

#echo "@todo Limiting monophone here .."; echo ENTER ; read;

mkdir -p xforms
mkdir -p zoel_hmm16
cp x240_m11_test.lst adapt.scp
fadapt="../scr_pdp1819_mono_good_001/train.lst"
fphone="../scr_pdp1819_mono_good_001/monophones1"
#cp $fphone ./monophones_zoel
mkdir -p lab_zoel
#cmd="HLED -l lab_zoel zoel.led ../../../small_vocabulary_/datas/v8_4475_doublefans/*.lab"
cmd="HLED -i zoel_adapt.mlf zoel.led ../../../small_vocabulary_/datas/v8_4475_doublefans/*.lab"
#echo $cmd ; eval $cmd; 
#echo "zoel_adapt.mlf created" ; read
#use_mlf="-L lab_zoel"
use_mlf="-I zoel_adapt.mlf"

mkdir -p zoel_classes
cmd="HERest -T 1 -C configtrain.txt -C config.semi -S $fadapt $use_mlf -u stw \
-H full_herest_out/06/hmmdefs   -h '*/*.mfc' -J zoel_classes \
-K zoel_hmm16 -M zoel_hmm16 monophones_zoel"
echo $cmd ; eval $cmd
echo ENTER ; read

mkdir -p zoel_hmm17
cmd="HERest -T 1 -C configtrain.txt  -S $fadapt $use_mlf -u tmvw \
-H zoel_hmm16/hmmdefs   -h '*/*.mfc' -J zoel_classes -J zoel_hmm16 \
 -M zoel_hmm17 monophones_zoel"
echo $cmd ; eval $cmd
echo ENTER ; read

