* IG-FinFET model for 20nm
* November 2012
* site : http:\\ece.ut.ac.ir\dsdlab\

.options post=2 brief

** determine HFIN and GEMOD
.param fin_height=2.8e-008


** subckt for IGNFinFET **
** nFinFET Drain Front_Gate Back_Gate Source num=1

.include './HP/20nfet.pm'
*.include './LSTP/20nfet.pm'
.hdl "./convertor.va" "NFinFETIG_module"

.subckt nFinFET NVd NVgf NVgb NVs num=1 Lg=24nm 
	* --- Input Capicitance --- *
	M10 NVdn NVgf 0 0 nfet nfin=num l=Lg
	M11 NVdn NVgb 0 0 nfet nfin=num l=Lg
	En1 NVdn 0 NVd  NVs 1
	* ---    Transistors   -----*
	X1 NVgf NVgb SGate NFinFETIG_module 
	M1 NVd SGate NVs 0 nfet nfin= 'num*2' l=Lg
.ends

******************************************************************

** subckt for IGPFinFET **
** pFinFET Drain Front_Gate Back_Gate Source num=1
.include './HP/20pfet.pm'
*.include './LSTP/20pfet.pm'
.hdl "./convertor.va" "PFinFETIG_module"
.param yza = 0.9
vvdd n1 0 yza
.global n1
*** vdd1 must be the same voltage source ***
.subckt pFinFET NVd NVgf NVgb NVs num=1 Lg=24nm
	* --- Input Capicitance --- *
	M10 NVdp NVgf n1 n1 pfet nfin = num l=Lg
	M11 NVdp NVgb n1 n1 pfet nfin = num l=Lg
	En1 NVdp n1 NVd NVs 1
	* ---    Transistors   -----*
	X1 NVgf NVgb SGate PFinFETIG_module supply=yza
	M1 NVd SGate NVs n1 pfet nfin= 'num*2' l=Lg
.ends
