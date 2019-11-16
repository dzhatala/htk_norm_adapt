for electrical switcher, double detection
use test.bat

#config_htk_live
#Coding parameters
SOURCEKIND=WAV
SOURCEFORMAT=HTK
#16000 khz = 62.5 mus = 625 ns
SOURCERATE=625.0
#TARGETKIND = MFCC_0_D_A_Z
TARGETKIND = MFCC_0_D_A
TARGETRATE = 100000.0
WINDOWSIZE = 250000.0
USEHAMMING = T
PREEMCOEF = 0.97
NUMCHANS = 26
CEPLIFTER = 22
NUMCEPS = 12

USESILDET=T
#USESILDET=F
MEASURESIL=F
OUTSILWARN=T
ENORMALISE=F
#AUDIOSIG=2
ZMEANSOURCE=T

HPARM:VOLUMESCALER = 0.3


fix double silence detecion by switching between audio and tmp\test.htk
   /****zoel hparm.c:4283 openaschhanel  ***/
   if (fname!=NULL) cf->useSilDet=FALSE;
   if (fname==NULL) cf->useSilDet=TRUE;
