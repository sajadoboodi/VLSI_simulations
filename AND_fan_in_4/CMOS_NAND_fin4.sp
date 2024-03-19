CMOS_NAND_fin4
***************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2

*******************************************

vdd	vdd gnd	dc	vddval

*******************************************

mp1	out	A	vdd	vdd	pmos	l=100n	w=300n
mp2	out	B	vdd	vdd	pmos	l=100n	w=300n
mp3	out	C	vdd	vdd	pmos	l=100n	w=300n
mp4	out	D	vdd	vdd	pmos	l=100n	w=300n

mn1	out	A	s1	gnd	nmos	l=100n	w=240n
mn2	s1	B	s2	gnd	nmos	l=100n	w=240n
mn3	s2	C	s3	gnd	nmos	l=100n	w=240n
mn4	s3	D	gnd	gnd	nmos	l=100n	w=240n	

*******************************************

VinA	A gnd	dc	vddval
VinB	B gnd	dc	vddval
VinC	C gnd	dc	vddval
VinD	D gnd	dc	vddval

*******************************************

.tran 10p 50n
.measure tran stpow avg power from=0n to=50n
.op
.end