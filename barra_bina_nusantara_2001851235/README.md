This example the power of HTK even super noisy sound ...

IF U DON'T UNDERSTAND...
performa Testing only, just download and extract until you see all directory structure
in your computer same with this web
now enter dir. /htk_normalization_adaptation/barra_bina_nusantara_2001851235
and perform steps. u need working cygwin (http://www.cygwin.com)

0. edit env_cygwin.sh
1. $ ./baum_viterbi_init_cyg.sh
2. $ ./makehmm_cyg.sh
3. $ ./monotest_cyg.sh
4. $ ./monoperf_cyg.sh

IF YOU'VE alread understood above steps and no error occur:
If you want to test against your own speech data:
Please CHANGE/EDIT these file :

0. zoel_tb.lst

1. phonems.lst

2. env_cygwin.sh

3. htk2_mfcc_lst.w32 (the sound is .htk)

4. rep_buf_BIRU_0001.lab (use SFS to label *.wav/*.htk, then export->annotation to HTK)




This is the work correspoding to my paper: Speech recognition for Indonesian language and its application to home automation, IEEE 4th International Conference On Information Technology, Information System and Electrical Engineering, Yogyakarta, Indonesia 20th November 2019

https://github.com/dzhatala/htk_norm_adapt/blob/master/hatala_2019_icitisee.pdf