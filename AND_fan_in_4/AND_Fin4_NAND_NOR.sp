AND_Fin4_NAND_NOR
*********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2
.global vdd

*********************
*******************************************
.SUBCKT	NAND2	A	B	OUT

mp1 OUT	A	vdd	vdd	pmos	l=100n	w=300n
mp2	OUT	B	vdd	vdd	pmos	l=100n	w=300n

mn1	OUT	A	s1	gnd	nmos	l=100n	w=240n
mn2	s1	B	gnd	gnd	nmos	l=100n	w=240n

.ends	NAND2

*******************************************
*******************************************
.SUBCKT	NOR2	A	B	OUT

mp1	d1	A	vdd	vdd	pmos	l=100n	w=600n
mp2	OUT	B	d1	vdd	pmos	l=100n	w=600n

mn1	OUT	A	gnd	gnd	nmos	l=100n	w=120n
mn2	OUT	B	gnd	gnd	nmos	l=100n	w=120n

.ends	NOR2

*******************************************

XN1	Vina	Vinb	out1	NAND2
XN2	Vinc	Vind	out2	NAND2
XR	out1	out2	output	NOR2

*********************	

vdd vdd	gnd dc vddval

VinA	Vina gnd	dc	vddval
VinB	Vinb gnd	dc	vddval
VinC	Vinc gnd	dc	vddval
VinD	Vind gnd	dc	vddval

.tran 10p 50n
.measure tran stpow avg power from=0n to=50n
.op
.end