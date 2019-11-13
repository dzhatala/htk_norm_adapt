@echo off
@call env.bat

set dir=hmm13_TS_mfcc_pca
@rem 
set dir=hmm15_cyg

@rem 
set phonems=triphones1_srtd
@rem set phonems=tiedlist

set dict=mono_dict.txt
@rem set dict=tri_dict.txt

set ftest=test.lst

@rem del /q cwords.net
set z_my_cmd=%HTKTOOLS_DIR%\HParse -T 1 wgram_cont.txt cwords.net
@echo on
@REM echo %z_my_cmd% 
%z_my_cmd%


del /q tmp\*
set outdir=..\..\wavs\results
@rem mkdir %outdir% 
@rem del /q recw.mlf
@rem set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Debug
set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Release
@rem set is_live=-g
set is_live=-S rep_test.lst
set is_live=-g
set rep_length=-Z 17
set rep_length=-Z 1
set rep_length=-Z 7
set saveaudioout=-e
set label_out=-i recw.mlf
set label_out=-l tmp\
@rem set z_my_cmd=%X_DIR%\HViteRepBuf_2 %saveaudioout% %rep_length%  %label_out%  -y rlv -T 1 %is_live% -w cwords.net -C configlive_pca.txt  -H %dir%\hmmdefs -o S  %dict% %phonems%
@set z_my_cmd=%X_DIR%\HTK_vs2008 %saveaudioout% %rep_length%  %label_out%  -y rlv -T 1 %is_live% -w cwords.net -C configlive_pca.txt  -H %dir%\hmmdefs -o S  %dict% %phonems%
@echo on
@echo %z_my_cmd% 
@%z_my_cmd% 

@rem cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w cwords.net -C configtrain.txt  -H $dir/hmmdefs \
@rem -o S -S ctest.lst $dict $phonems"
@rem echo $cmd ; eval $cmd

 
