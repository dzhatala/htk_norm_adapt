set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Release
set htks=tmp1\rep_buf_Sun_Nov_10_09_29_07_2019.htk ^
tmp1\rep_buf_Sun_Nov_10_09_29_12_2019.htk ^
tmp1\rep_buf_Sun_Nov_10_09_29_17_2019.htk

set hmms=-H zoel_hmm17\hmmdefs -J zoel_hmm16 semitied -J zoel_classes
@rem set hmms=-H hmm1\hmmdefs -J zoel_hmm16 semitied -J zoel_classes
@rem set hmms=-H hmm1\hmmdefs
@rem set htks=
set config=-C zoel_config_live.txt
@rem set config=-C config_test_htk.txt
%X_DIR%\HTK_vs2008.exe -T 1 -Z 7 -g -e  %hmms% ^
 -i zoel_rec.mlf ^
-w cwords.net  %config% -p 0.0 -s 1.0 ^
zoel_mono.dict monophones_zoel %htks%
