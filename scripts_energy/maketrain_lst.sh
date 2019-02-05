source env_cygwin.sh

for x in `ls $labdir/*.lab | sort -r`
do 
	y=`echo $x | sed s/lab/mfc/`
	z=`echo $x | sed s/lab/htk/`
	echo "$z	$y"
done  > htk2_mfcc_lst.w32

for x in `ls $labdir/*.lab`
do 
	y=`echo $x | sed s/lab/mfc/`
	echo "$y"
done  > train.lst

cp train.lst test.lst
cp train.lst ctest.lst

