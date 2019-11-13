#source env_cygwin.sh


wlabdir=../../wavs/wlabgen
#cat $wlabdir/*.lab | cut -f 3 -d " " | sort | uniq > words.lst
#echo "words list in words.lst [ENTER]" ;  read
cmd="HResults -T 1 -e SILSP NOISE -p  -I zoel_words.mlf wlist zoel_rec.mlf"

echo $cmd ; eval $cmd



date
