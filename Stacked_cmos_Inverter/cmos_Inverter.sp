cmos_Inverter
********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2

********************
.option post = 2

mp1	out	input	s	s	pmos	l=100n	w=300n

mn1 out	input	gnd	gnd	nmos	l=100n	w=120n

vdd s gnd dc vddval

Vin	input gnd	dc	vddval

.tran 10p 50n

.measure tran stpow avg power from=0n to=50n

.op
.end
