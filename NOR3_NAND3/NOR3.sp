NOR3_CMOS
*********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2
*.temp	25

*********************

*******************************************


mp1	d1	A	vdd	vdd	pmos	l=100n	w=900n
mp2	d2	B	d1	vdd	pmos	l=100n	w=900n
mp3	OUT	C	d2	vdd	pmos	l=100n	w=900n

mn1	OUT	A	gnd	gnd	nmos	l=100n	w=120n
mn2	OUT	B	gnd	gnd	nmos	l=100n	w=120n
mn3	OUT	C	gnd	gnd	nmos	l=100n	w=120n


*******************************************	

vdd vdd	gnd dc vddval

VinA	A gnd	dc	vddval
VinB	B gnd	dc	vddval
VinC	C gnd	dc	vddval

.tran 10p 50n
.measure tran stpow avg power from=0n to=50n
.op
.end