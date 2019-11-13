sync
source env_cygwin.sh
echo "use datadir=$datadir"
HVITE=$HTKTOOLS_DIR/HVite
rm -f hmm0/*
mkdir -p hmm0
init_name=initial_0_D_A
cp hinitoutput/$init_name hmm0/
echo "ubuntu listing phonems from $labdir "
awk '{
	print $3
	
}'  $labdir/*.lab | sort | uniq > phonems.lst   #change lab file here, to include all use $labdir/*.lab
sort phonems.lst | uniq | sort | uniq > monophones1
