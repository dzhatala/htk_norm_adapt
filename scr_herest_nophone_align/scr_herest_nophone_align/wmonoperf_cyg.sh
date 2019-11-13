source env_cygwin.sh


wlabdir=../../wavs/wlabgen
cat $wlabdir/*.lab | cut -f 3 -d " " | sort | uniq > words.lst
echo "words list in words.lst [ENTER]" ;  read
cmd="$HTKTOOLS_DIR/HResults -e SILSP NOISE -p  -L $wlabdir words.lst recw.mlf"

echo $cmd ; eval $cmd


cmd="$HTKTOOLS_DIR/HResults -L $wlabdir monophones1 recw.mlf"

#echo $cmd ; eval $cmd

date
