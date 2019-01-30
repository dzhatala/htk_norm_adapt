source env_cygwin.sh

cmd="$HTKTOOLS_DIR/HResults -L $labdir monoperf1.lst recph.mlf"

echo $cmd ; eval $cmd
date
