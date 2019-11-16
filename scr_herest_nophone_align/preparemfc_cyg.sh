source env_cyg_titml_idn.sh
echo "using datadir=$datadir [ENTER]"; read

if [ "remove"  == "1remove" ]; then
	rm -f $labdir/*.mfc
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi
#read
#cmd="$HTKTOOLS_DIR/HCopy -T 1 -C configcopy_wav_mfcc.txt -S wav2mfcc_cyg.lst"
#cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy_wav_mfcc.txt -S $full_hcopy_list"
cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy_htk_mfcc.txt -S htk2_mfcc_lst.w32"
echo $cmd ; eval $cmd
