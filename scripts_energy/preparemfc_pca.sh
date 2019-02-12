source env_cygwin.sh
echo "using datadir=$datadir [ENTER]"; read

if [ "remove"  == "not remove cause ?" ]; then
	rm -f $datadir/*.pca
else 
	echo "WARNING:  $0 NOT cleaning old pca in $datadir "
fi
#read
cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy_mfc_pca.txt -S mfc_2_pca.lst"
echo $cmd ; eval $cmd

