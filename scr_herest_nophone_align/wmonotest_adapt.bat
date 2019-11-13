@call env.bat
%HTKTOOLS_DIR%\HVite -T 1 -H hmm17\hmmdefs -S x240_m11_test.lst -l '*' -J hmm16 -J classes -i hmm17_recph.mlf -w LM\word_bg_net -C configtrain.txt -p 0.0 -s 5.0 dict_full monophones1_full.txt
