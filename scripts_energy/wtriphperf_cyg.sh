source env_cygwin.sh

#cmd="$HTKTOOLS_DIR/HResults -L $wlabdir monophones1 recw.mlf"
#echo $cmd ; eval $cmd
#cut -f 1 cdict.txt | sort | uniq > wlist.txt
cmd="$HTKTOOLS_DIR/HResults -L $wlabdir -p wlist.txt recw.mlf"
echo $cmd ; eval $cmd
date
