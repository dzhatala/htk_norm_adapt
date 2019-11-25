source env_cygwin.sh

cmd="cp phonems.lst monophones1"
echo $cmd ; eval $cmd

cmd="$HTKTOOLS_DIR/HResults -e NNN sil  -p -L $labdir monophones1 recph.mlf"

echo $cmd ; eval $cmd
date
