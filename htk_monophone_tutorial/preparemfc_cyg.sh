source env_cygwin.sh
echo "using datadir=$datadir [ENTER]"; read

if [ "remove"  == "1remove" ]; then
	rm -f $datadir/*.mfc
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi
#read
#cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy.txt -S wav2mfcc_lst.w32"
cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy_htk_mfcc.txt -S htk2_mfcc_lst.w32"
echo $cmd ; eval $cmd
