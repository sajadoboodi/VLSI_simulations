AND_Fin4_NAND_NOR
*********************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2
.global vdd
.param t=10p
.param vddval_2='vddval/2'

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

*******************************************	

vdd vdd	gnd dc vddval

*VinA	Vina gnd	dc	vddval
*VinB	Vinb gnd	dc	vddval
*VinC	Vinc gnd	dc	vddval
*VinD	Vind gnd	dc	vddval

Vina Vina 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval, 4n vddval, '5n-t' vddval,
+ 5n vddval, '6n-t' vddval,6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+ 10n vddval, '11n-t' vddval)

Vinb Vinb 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n vddval, '3n-t' vddval, 3n vddval, '4n-t' vddval, 4n 0, '5n-t' 0,
+ 5n 0, '6n-t' 0, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

Vinc Vinc 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval,4n 0, '5n-t' 0,
+ 5n vddval, '6n-t' vddval, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n 0, '9n-t' 0, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

Vind Vind 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval, 4n vddval, '5n-t' vddval,
+ 5n vddval, '6n-t' vddval,6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n 0, '9n-t' 0, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

.tran 10p 11n

.measure	tran	tpcout1 trig	v(Vina)	td=2.9n val=vddval_2	cross=1 targ v(output)	td=2.9n val=vddval_2	cross=1
.measure	tran	tpcout2 trig	v(Vinb)	td=3.9n val=vddval_2	cross=1 targ v(output)	td=3.9n val=vddval_2	cross=1
.measure	tran	tpcout3 trig	v(Vinc)	td=6.8n val=vddval_2	cross=1 targ v(output)	td=6.8n val=vddval_2	cross=1
.measure	tran	tpcout4 trig	v(Vind)	td=7.9n val=vddval_2	cross=1 targ v(output)	td=7.9n val=vddval_2	cross=1
.measure	tran	tpcout5 trig	v(Vina)	td=9.8n val=vddval_2	cross=1 targ v(output)	td=9.8n val=vddval_2	cross=1

Cload output 0 5f

*.tran 10p 50n
*.measure tran stpow avg power from=0n to=50n
.op
.end