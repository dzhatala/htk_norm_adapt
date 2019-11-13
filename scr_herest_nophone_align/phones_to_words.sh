sync
source env_cygwin.sh


wlabdir="../../wavs/wlabgen"
mkdir -p $wlabdir
echo "ENTER to delete .lab files in $wlabdir !" ; read
rm $wlabdir/*.lab

#cp cdict.txt mono_dict.txt
cp zoel_mono.dict mono_dict.txt

gawk  '{
	w="ME "
	for (i=1;i<=NF;i++) w=w " " $i
	#w=w " " $1
	if(NF>1)
	print w
	#split($1,ar)

}' mono_dict.txt | sort  > tmp.led
echo "RE SILSP lsil NNN" >> tmp.led
awk '{ print length($0) " " $0; }' tmp.led | sort -r -n | cut -d ' ' -f 2- > ph2word.led
#
#cp tmp.led ph2word.led ; echo sort from long to short then uncomment and rerun this scripts !!!

cmd="$HTKTOOLS_DIR/HLEd -l $wlabdir ph2word.led $datadir/*.lab"
echo $cmd  ; eval $cmd
cmd="$HTKTOOLS_DIR/HLEd -l '*' -i zoel_words.mlf ph2word.led $datadir/*.lab"
echo $cmd  ; eval $cmd

#echo word list
#cut -f 3 -d " " $wlabdir/*.lab | sort | uniq > ph2word.cvt
#cat ph2word.cvt
#echo "words labs created in $wlabdir "
#echo "words labs created in $wlabdir, list in ph2word.cvt "

