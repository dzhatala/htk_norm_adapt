./maketrain_lst.sh
echo "matlab mfc_to_pca !! " ; read
echo baum_viterbi_init
yes | ./baum_viterbi_init_cyg_pca.sh
yes | ./makehmm_cyg_pca.sh
yes | ./mktrilab_cyg.sh
yes | ./maketrip_cyg_pca.sh
