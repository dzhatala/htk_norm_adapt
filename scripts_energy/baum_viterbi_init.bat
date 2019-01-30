@call env.bat
mkdir  hinitoutput
@rem set trace_flag="-T 511"
set trace_flag=-T 1
set initial_file=initial_0_D_A
set z_my_cmd=%HTKTOOLS_DIR%\HInit  %trace_flag%  -C configtrain.txt  -m 1 -M hinitoutput %initial_file% -S train_lst.w32
@echo on
echo %z_my_cmd% 
@rem ; eval $cmd
@rem set
@%z_my_cmd%
