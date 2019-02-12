#source env_cygwin.sh
source env_cyg_mfcc_pca.sh
echo "datadir $datadir"
echo "labdir $labdir"
echo "wait ... "
for x in `ls $labdir/*.lab | sort -r`
do 
	y=`echo $x | sed s/lab/mfc/`
	z=`echo $x | sed s/lab/htk/`
	echo "$z	$y"
done  > htk2_mfcc_lst.w32

for x in `ls $labdir/*.lab | sort -r`
do 
	y=`echo $x | sed s/lab/mfc/`
	z=`echo $x | sed s/lab/wav/`
	echo "$z	$y"
done  > wav2mfcc.lst

for x in `ls $labdir/*.lab`
do 
	y=`echo $x | sed s/lab/mfc/`
	echo "$y"
done  > train.lst

for x in `ls $labdir/*.lab`
do 
	y=`echo $x | sed s/lab/pca/`
	echo "$y"
done  > train_pca.lst

cp train.lst test.lst
cp train.lst ctest.lst
echo "completed"
