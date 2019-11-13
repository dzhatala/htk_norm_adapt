
set is_replay=-g 
set rep_length=-Z 17
set rep_length=-Z 13
@rem set rep_length=-Z 0.1
@rem 
set rep_length=-Z 7
set saveaudioout=-e

set fmatch=-h '.\tmp\test.htk'

set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Release
@rem %X_DIR%\HTK_vs2008.exe -C configlive_semitied.txt ^
@rem %saveaudioout% %rep_length% %is_replay% ^
@rem -T 1 -H hmm15\hmmdefs  ^
@rem -J xforms mllr2  -k  ^
@rem -w cwords.net -J classes -p 0.0 -s 5.0 ^
@rem zoel_mono.dict monophones_zoel
set test_data=
@rem set test_data=tmp/test.htk
set X_DIR=f:\rsync\RESEARCHS\htkbook_to_c_code\htk_normalization_adaptation\vs2008_semitied_INXform\projecs_vs2008\Release

@rem %X_DIR%\HTK_vs2008.exe -T 1 -H zoel_hmm17\hmmdefs -l '*' ^
%X_DIR%\HVite_vs2008_INXFORM.exe -T 1 -H zoel_hmm17\hmmdefs -l '*' ^
%saveaudioout% %rep_length% %is_replay% ^
-J zoel_hmm16 -J zoel_classes -i zoel_rec.mlf ^
-w cwords.net -C config_htk_live.txt -p 0.0 -s 1.0 ^
zoel_mono.dict monophones_zoel %test_data%


