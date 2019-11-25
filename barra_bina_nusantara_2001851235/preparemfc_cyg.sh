source env_cygwin.sh

echo "using datadir=$datadir [ENTER]"; read
if [ "remove"  == "remove" ]; then	
	echo " all .mfc in $datadir will be removed ? [ENTER]"; read
	rm -f $datadir/*.mfc
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi

fconfig=configcopy_htk_mfcc.txt
#fconfig=configcopy_wav_mfcc.txt

cmd="$HTKTOOLS_DIR/HCopy -T 1 -C $fconfig -S htk2_mfcc_lst.w32"
echo $cmd ; eval $cmd
