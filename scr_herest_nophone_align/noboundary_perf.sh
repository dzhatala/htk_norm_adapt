source env_cygwin.sh

cmd="head -5 $labdir/no_boundary/rep_buf_BIRU_0001.lab"
echo $cmd ; eval $cmd
#conf_table="-p"
cmd="$HTKTOOLS_DIR/HResults -e NNN sil  $conf_table -L $labdir/no_boundary monophones1 $labdir/no_boundary/rep_buf_BIRU_0001.lab"

echo $cmd ; eval $cmd
date
