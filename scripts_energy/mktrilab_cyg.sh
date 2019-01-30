source env_cygwin.sh
echo datadir=$datadir
mkdir -p $trilab
rm -f $trilab/*.lab  
rm -f triphones1 triphones1_srtd && sync
cmd="$HTKTOOLS_DIR/HLEd -T 3    -l $trilab  -n triphones1 mktri.led $labdir/NUM_1_*.lab $labdir/NUM_2*.lab"  # change here to include all use trilab/*.lab
echo $cmd ; eval $cmd;
sync; sort triphones1 > triphones1_srtd
echo "sp" >> triphones1_srtd
echo "triphones1 triphones_srtd created"
