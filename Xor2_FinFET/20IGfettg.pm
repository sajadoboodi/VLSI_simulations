* IG-FinFET model for 20nm
* November 2012
* site : http:\\ece.ut.ac.ir\dsdlab\

.options post=2 brief

** determine HFIN and GEMOD
.param fin_height=2.8e-008

** subckt for IGNFinFET **
** nFinFET Drain Front_Gate Back_Gate Source num=1

.include './HP/20nfettg.pm'
*.include './LSTP/20nfettg.pm'
.hdl "./convertortg.va" "NFinFETIGtg_module"

.subckt nFinFETtg NVd NVgf NVgb NVs num=1 Lg=24nm 
	* --- Input Capicitance --- *
	M10 NVdn NVgf 0 0 nfettg nfin=num l=Lg
	M11 NVdn NVgb 0 0 nfettg nfin=num l=Lg
	En1 NVdn 0 NVd  NVs 1
	* ---    Transistors   -----*
	X1 NVgf NVgb SGate NFinFETIGtg_module 
	M1 NVd SGate NVs 0 nfettg nfin= 'num*2' l=Lg
.ends

******************************************************************

** subckt for IGPFinFET **
** pFinFET Drain Front_Gate Back_Gate Source num=1
.include './HP/20pfettg.pm'
*.include './LSTP/20pfettg.pm'
.hdl "./convertortg.va" "PFinFETIGtg_module"

*** vdd1 must be the same voltage source ***
.subckt pFinFETtg NVd NVgf NVgb NVs num=1 Lg=24nm
	* --- Input Capicitance --- *
	M10 NVdp NVgf n1 n1 pfettg nfin = num l=Lg
	M11 NVdp NVgb n1 n1 pfettg nfin = num l=Lg
	En1 NVdp n1tg NVd NVs 1
	* ---    Transistors   -----*
	X1 NVgf NVgb SGate PFinFETIGtg_module supply=yza
	M1 NVd SGate NVs n1 pfettg nfin= 'num*2' l=Lg
.ends
