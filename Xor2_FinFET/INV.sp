FINfet

.option abstol=1e-6 reltol=1e-6 post ingold dcon=1

.protect
.include '20IGfet.pm'
.include '20IGfetTG.pm'
.unprotect


***********************************************************************
*Circuit
***********************************************************************

Xp1	out	in	in	vdd	   pFinFETtg		num = 1
Xn1	out	in	in	0	   nFinFETtg		num = 1

***********************************************************************

.param vddval=0.9

***********************************************************************


*** Voltage ***

Vdd Vdd 0 Vddval 

Vin in 0  0


.dc vin 0 vddval 1m

.end
