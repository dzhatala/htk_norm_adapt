source env_cygwin.sh
echo "using datadir=$datadir [ENTER]"; read

if [ "remove"  == "1remove" ]; then
	rm -f $datadir/*.pca
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi
#read
cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy_htk_mfcc.txt -S mfc_2_paca.lst"
echo $cmd ; eval $cmd
