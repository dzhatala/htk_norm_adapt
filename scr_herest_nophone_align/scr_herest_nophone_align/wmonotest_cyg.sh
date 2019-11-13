source env_cygwin.sh

dir=hmm1
phonems=monophones1
dict=mono_dict.txt


wlabdir=../../wavs/wlabgen

echo "Ceating test list from words lab $wlabdir  into ctest.lst [ENTER]" ; read

cp /dev/null ctest.lst; sync
for ft in `ls $wlabdir/*.lab`
do
	#echo $ft | sed "s/$wlabdir/hello//"
	#echo $ft| sed s/$wlabdir/$datadir/ | sed s/"\.lab"/".mfc"/ >> ctest.lst 
	echo $ft>> ctest.lst

done
sed -i "s/\.lab/\.mfc/" ./ctest.lst ;sync
cmd="sed -i \"s|$wlabdir|$datadir|\" ./ctest.lst" ; echo $cmd
eval $cmd;sync
#cat ctest.lst
echo "completed [ENTER]";read

ftest=ctest.lst
gram=wgram_isol.txt
gram=wgram_cont.txt
rm -f words.net
cmd="$HTKTOOLS_DIR/HParse $gram words.net"
echo $cmd ; eval $cmd



#where to put world labs
#outdir="wlabdir"
mkdir -p $outdir
rm -f recw.mlf
penalty="-p -0.0 -s 5.0"
#cmd="$HTKTOOLS_DIR/HVite $penalty  -l $outdir -y recw  -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
# -o S -S $ftest $dict $phonems"
#echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite $penalty   -i recw.mlf -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
echo $cmd ; eval $cmd

 
