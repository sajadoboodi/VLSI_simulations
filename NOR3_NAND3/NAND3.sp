NAND3_CMOS
*********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2
*.temp	25

*********************

*******************************************


mp1	OUT	A	vdd	vdd	pmos	l=100n	w=300n
mp2	OUT	B	vdd	vdd	pmos	l=100n	w=300n
mp3	OUT	C	vdd	vdd	pmos	l=100n	w=300n

mn1	OUT	A	s1	gnd	nmos	l=100n	w=360n
mn2	s1	B	s2	gnd	nmos	l=100n	w=360n
mn3	s2	C	gnd	gnd	nmos	l=100n	w=360n


*******************************************	

vdd vdd	gnd dc vddval

VinA	A gnd	dc	0
VinB	B gnd	dc	0
VinC	C gnd	dc	0

.tran 10p 50n
.measure tran stpow avg power from=0n to=50n
.op
.end