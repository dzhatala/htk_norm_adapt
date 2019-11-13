# HLed -i wordlab.mlf  empty.lef /cygdrive/f/rsync/RESEARCHS/small_vocabulary_/datas/TITML-IDN/zoel_stats/htk/wd_no_time/*.lab

cmd=" HLStats.exe  -T 1 -b bigfn -o wordbigram wordlab.mlf"
echo $cmd ;eval $cmd
cmd=" HBuild.exe -n bigfn wordbigram  word_bg_net"
echo $cmd ; eval $cmd

