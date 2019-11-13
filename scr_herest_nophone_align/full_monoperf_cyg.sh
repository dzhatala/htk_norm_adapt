source env_cyg_titml_idn.sh

use_mlf="-L gen_lab"
#use_mlf="-I full_aligned.mlf"
#print_confusing_mat="-p"
result_mlf=04_recph.mlf
#result_mlf=hmm17_recph.mlf
cmd="$HTKTOOLS_DIR/HResults   $print_confusing_mat  $use_mlf  monophones1_full.txt $result_mlf"

echo $cmd ; eval $cmd
date
