source env_cygwin.sh


cmd="$HTKTOOLS_DIR/HResults -e NNN sil  -p -L $labdir monophones1 recph.mlf"

echo $cmd ; eval $cmd
date
