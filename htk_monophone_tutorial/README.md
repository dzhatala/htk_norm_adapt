This tutorial will show how to develop
Monophone HMM using HTK in cygwin environment.

DATA need to download also:
in : ../v8_4475_doublefans/*.htk (HTK PCM raw), if u use
WAV (Microsoft) edit/change configcopy_htk_mfcc.txt

Steps-0:
Edit env_cygwin.sh: 
change this line  == >HTKTOOLS_DIR="your_htk_dir/HTKTools"

Steps-1:
Execute this bash scripts files
$ pwd
/cygdrive/..../htk_monophone_tutorial
$ chmod +x  *.sh
$ ./preparemfc_cyg.sh
$ ./baum_viterbi_init_cyg.sh
$ ./makehmm_cyg.sh
$ ./monotest_cyg.sh
$ ./monoperf_cyg.sh
