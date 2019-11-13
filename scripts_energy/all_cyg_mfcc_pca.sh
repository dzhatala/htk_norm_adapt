#yes | ./maketrain_lst.sh ; echo  "preparemfc.bat ?[ENTER]" ; read
#yes | ./baum_viterbi_init_cyg_mfcc_pca.sh
yes| ./makehmm_cyg_mfcc_pca.sh
yes | ./mktrilab_cyg.sh
yes | ./maketrip_cyg_mfcc_pca.sh
