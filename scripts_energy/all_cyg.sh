./maketrain_lst.sh
echo "preparemfc.bat" ; read
echo baum_viterbi_init_cyg.sh
yes | ./baum_viterbi_init_cyg.sh
yes | ./makehmm_cyg.sh
yes | ./mktrilab_cyg.sh
yes | ./maketrip_cyg.sh
