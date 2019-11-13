source env_cyg_titml_idn.sh


cmd="$HTKTOOLS_DIR/HResults    -p -L $lab_ph_no_time_dir monophones1 recph.mlf"

echo $cmd ; eval $cmd
date
