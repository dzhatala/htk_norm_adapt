source ./env_cygwin.sh
echo datadir=$datadir
mkdir -p $trilab
rm -f $trilab/*lab
rm -f triphones1 triphones1_srtd && sync
echo "setp 9 htkbook"
TRILAB_OR_WINTRI="-l $trilab"
cmd="$HTKTOOLS_DIR/HLEd -T 3      -n triphones1 $TRILAB_OR_WINTRI mktri.led $labdir/*.lab"
echo $cmd ; eval $cmd;
TRILAB_OR_WINTRI="-i wintri.mlf"
cmd="$HTKTOOLS_DIR/HLEd -T 3      -n triphones1 $TRILAB_OR_WINTRI mktri.led $labdir/*.lab"
echo $cmd ; eval $cmd;

echo wintri.mlf and trilab both filled
sync; sort triphones1 > triphones1_srtd
echo "sp" >> triphones1_srtd
echo "triphones1 triphones1_srtd created"
