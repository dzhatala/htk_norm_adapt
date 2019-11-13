sync
source env_cyg_titml_idn.sh
use_flist="-S zoel_test.lst"
#use_flist=""
use_config="-C configtrain.txt"
cmd="HVite $use_config -T 1 -H hmm15/hmmdefs $use_flist -l '*' \
-J xforms mllr2 -h '*.mfc' -k -i recoutAdapt.mlf -w cwords.net \
-J classes  -p 0.0 -s 5.0 zoel_mono.dict monophones_zoel"
echo $cmd ; eval $cmd

use_mlf="-I zoel_words.mlf"
cmd="HResults -T 1 -e SILSP NOISE -p -L ../../wavs/wlabgen wlist recoutAdapt.mlf"
echo $cmd ; eval $cmd
