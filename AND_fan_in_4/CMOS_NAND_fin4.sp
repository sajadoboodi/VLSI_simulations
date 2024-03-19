CMOS_NAND_fin4
***************

.protect
.lib 'mm90.l' TT
.unprotect
.param vddval = 1.2
.option post = 2
.param t=10p
.param vddval_2='vddval/2'

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

*VinA	A gnd	dc	vddval
*VinB	B gnd	dc	vddval
*VinC	C gnd	dc	vddval
*VinD	D gnd	dc	vddval

Vina A 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval, 4n vddval, '5n-t' vddval,
+ 5n vddval, '6n-t' vddval,6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+ 10n vddval, '11n-t' vddval)

Vinb B 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n vddval, '3n-t' vddval, 3n vddval, '4n-t' vddval, 4n 0, '5n-t' 0,
+ 5n 0, '6n-t' 0, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

Vinc C 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval,4n 0, '5n-t' 0,
+ 5n vddval, '6n-t' vddval, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n 0, '9n-t' 0, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

Vind D 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval, 4n vddval, '5n-t' vddval,
+ 5n vddval, '6n-t' vddval,6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n 0, '9n-t' 0, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

.tran 10p 11n

.measure	tran	tpcout1 trig	v(A)	td=2.9n val=vddval_2	cross=1 targ v(out) td=2.9n val=vddval_2	cross=1
.measure	tran	tpcout2 trig	v(B)	td=3.9n val=vddval_2	cross=1 targ v(out) td=3.9n val=vddval_2	cross=1
.measure	tran	tpcout3 trig	v(C)	td=6.8n val=vddval_2	cross=1 targ v(out) td=6.8n val=vddval_2	cross=1
.measure	tran	tpcout4 trig	v(D)	td=7.9n val=vddval_2	cross=1 targ v(out)	td=7.9n val=vddval_2	cross=1
.measure	tran	tpcout5 trig	v(A)	td=9.8n val=vddval_2	cross=1 targ v(out)	td=9.8n val=vddval_2	cross=1

Cload out 0 5f

*******************************************

*.tran 10p 50n
*.measure tran stpow avg power from=0n to=50n
.op
.end