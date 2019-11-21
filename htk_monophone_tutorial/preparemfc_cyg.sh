source env_cygwin.sh

echo "using datadir=$datadir [ENTER]"; read
if [ "remove"  == "remove" ]; then	
	echo " all .mfc in $datadir will be removed ? [ENTER]"; read
	rm -f $datadir/*.mfc
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi
cmd="$HTKTOOLS_DIR/HCopy -T 1 -C configcopy_htk_mfcc.txt -S htk2_mfcc_lst.w32"
echo $cmd ; eval $cmd
