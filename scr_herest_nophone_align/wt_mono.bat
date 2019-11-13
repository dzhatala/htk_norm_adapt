@echo off
@call env.bat

set use_hmm=-H hmm1\hmmdefs
@rem set use_hmm=-H zoel_hmm17\hmmdefs  -J zoel_hmm16 -J zoel_classes
set phonems=monophones_zoel

set dict=zoel_mono.dict


set z_my_cmd=%HTKTOOLS_DIR%\HParse -T 1 wgram_cont.txt cwords.net
@echo on
@REM echo %z_my_cmd% 
@rem %z_my_cmd%


del /q tmp\*
set outdir=..\..\wavs\results
@rem mkdir %outdir% 
@rem del /q recw.mlf
@rem set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Debug
set X_DIR=F:\rsync\RESEARCHS\small_vocabulary_\vs2008\projecs_vs2008\Release

@rem is_replay for saving and recoding also playing ...
@rem 
set is_replay=
@rem 
set is_replay=-g 
set rep_length=-Z 17
set rep_length=-Z 13
@rem set rep_length=-Z 0.1
@rem 
set rep_length=-Z 7

@rem must set is_replay=-g to use save audio out
set saveaudioout=-e
@rem set saveaudioout=
set label_out=-i recw.mlf
set label_out=-l tmp\
@rem set z_my_cmd=HVIte_rep_buf_005 %saveaudioout% %rep_length%  %label_out%  -y rlv -T 1 %is_replay% -w cwords.net -C configlive_pca.txt  -H %dir%\hmmdefs -o S  %dict% %phonems%
@rem set config=-C config_test_htk.txt
@rem 
set config=-C configlive_pca.txt 

set z_my_cmd=%X_DIR%\HTK_vs2008.exe %saveaudioout% %rep_length%  %label_out%  
set z_my_cmd=%z_my_cmd% -y rlv -T 1 %is_replay% -w cwords.net %config%
set z_my_cmd=%z_my_cmd% %use_hmm% -o S  %dict% %phonems% 
rem tmp\*.htk

@echo on
@echo %z_my_cmd% 
@%z_my_cmd% 

@rem cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w cwords.net -C configtrain.txt  -H $dir/hmmdefs \
@rem -o S -S ctest.lst $dict $phonems"
@rem echo $cmd ; eval $cmd
