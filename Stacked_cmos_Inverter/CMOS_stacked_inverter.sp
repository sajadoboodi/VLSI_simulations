CMOS_stacked_inverter
*********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2

*********************
.option post = 2

mp1	out	input	vdd	vdd	pmos	l=100n	w=300n

mn1 out	input	s1	gnd	nmos	l=100n	w=120n

mn2	s1	input	gnd	gnd	nmos	l=100n	w=120n	

vdd vdd	gnd dc vddval

Vin	input gnd	dc	vddval

.tran 10p 50n

.measure tran stpow avg power from=0n to=50n

.op
.end