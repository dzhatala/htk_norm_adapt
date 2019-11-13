source env_cyg_titml_idn.sh

phonems=monophones1_full.txt
dict=full_phone1.dic
 
cp /dev/null $dict ;sync
awk '{
	if (index($0,"sp")>0){
		#print "sil\tsp"
	}else
	print $1,"\t",$1 
	
}' $phonems > $dict

sync
#echo "test" ; read

$HTKTOOLS_DIR/HBuild $dict phone.net
#outdir="../../wavs/results"
dir=full_herest_out/04
ftest=x240_test.lst
mkdir -p $outdir		# outdir in env.sh
cmd="$HTKTOOLS_DIR/HVite  -T 1 -i 04_recph.mlf -T 0 -w phone.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $ftest $dict $phonems"
#echo $cmd ; eval $cmd ; echo ENTER ; read

#adaptation version 
cmd="HVite -T 1 -H hmm17/hmmdefs -S x240_m11_test.lst -l '*' \
-J hmm16 -J classes -i hmm17_recph.mlf -w phone.net \
-C configtrain.txt -p 0.0 -s 5.0 $dict $phonems"
echo $cmd; eval $cmd ; echo ENTER ; read
