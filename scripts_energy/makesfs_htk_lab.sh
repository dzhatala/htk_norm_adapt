#source env_cygwin.sh
source env_cyg_mfcc_pca.sh
echo "datadir $datadir"
echo "labdir $labdir"
echo "wait ... "
for x in `ls $labdir/*.lab | sort -r`
do 
	y=`echo $x | sed s/lab/sfs/`
	cmd="rm -f $y"
	echo $cmd ; eval $cmd;
	cmd="./sfs_progs/hed -n $y"
	echo $cmd ; eval $cmd;
	z=`echo $x | sed s/lab/wav/`
	cmd="./sfs_progs/slink -isp. -f 16000 $z $y"
	echo $cmd ; eval $cmd;
	cmd="./sfs_progs/anload -t phones -h  $x $y"
	echo $cmd ; eval $cmd;
	echo ""
done

