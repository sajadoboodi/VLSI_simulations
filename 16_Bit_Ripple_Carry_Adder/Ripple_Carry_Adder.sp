Ripple_Carry_Adder
*********************

.protect
.lib 'mm90.l' TT
.lib 'mm90.l' TT_hvt
.unprotect

.param vddval = 1.2
.param vddval_2 = 'vddval/2'
.param t=10p
.option post = 2
.temp	25
.global vdd

*********************
***************************************************

mp1	n1	B	vdd	vdd	pmos	l=100n	w=600n
mp2	n1	A	vdd	vdd	pmos	l=100n	w=600n
mp3	n2	A	vdd	vdd	pmos	l=100n	w=600n
mp4	coutb	C	n1	vdd	pmos	l=100n	w=600n
mp5	coutb	B	n2	vdd	pmos	l=100n	w=600n

mn1	coutb	C	n3	gnd	nmos	l=100n	w=240n
mn2	coutb	B	n4	gnd	nmos	l=100n	w=240n
mn3	n3	B	gnd	gnd	nmos	l=100n	w=240n
mn4	n3	A	gnd	gnd	nmos	l=100n	w=240n
mn5	n4	A	gnd	gnd	nmos	l=100n	w=240n


mp6	n5	C	vdd	vdd	pmos	l=100n	w=600n
mp7	n5	A	vdd	vdd	pmos	l=100n	w=600n
mp8	n5	B	vdd	vdd	pmos	l=100n	w=600n
mp9	sumb	coutb	n5	vdd	pmos	l=100n	w=600n

mn6	sumb	coutb	n6	gnd	nmos	l=100n	w=240n
mn7	n6	C	gnd	gnd	nmos	l=100n	w=240n
mn8	n6	A	gnd	gnd	nmos	l=100n	w=240n
mn9	n6	B	gnd	gnd	nmos	l=100n	w=240n


mp10	n7	A	vdd	vdd	pmos	l=100n	w=900n
mp11	n8	B	n7	vdd	pmos	l=100n	w=900n
mp12	sumb	C	n8	vdd	pmos	l=100n	w=900n

mn10	sumb	C	n9	gnd	nmos	l=100n	w=360n
mn11	n9	B	n10	gnd	nmos	l=100n	w=360n
mn12	n10	A	gnd	gnd	nmos	l=100n	w=360n

mp13	cout	coutb	vdd	vdd	pmos	l=100n	w=300n

mn13	cout	coutb	gnd	gnd	nmos	l=100n	w=120n

mp14	sum	sumb	vdd	vdd	pmos	l=100n	w=300n

mn14	sum	sumb	gnd	gnd	nmos	l=100n	w=120n

***************************************************

vdd	vdd	gnd	vddval

*VinA	A	gnd	dc	vddval
*VinB	B	gnd	dc	vddval
*VinC	C	gnd	dc	vddval

Vina A 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval, 4n vddval, '5n-t' vddval,
+ 5n vddval, '6n-t' vddval,6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+ 10n vddval, '11n-t' vddval)

Vinb B 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n vddval, '3n-t' vddval, 3n vddval, '4n-t' vddval, 4n 0, '5n-t' 0,
+ 5n 0, '6n-t' 0, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n vddval, '9n-t' vddval, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)

Vinc C 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '3n-t' 0, 3n vddval, '4n-t' vddval,4n 0, '5n-t' 0,
+ 5n vddval, '6n-t' vddval, 6n 0, '7n-t' 0, 7n vddval, '8n-t' vddval, 8n 0, '9n-t' 0, 9n 0, '10n-t' 0,
+10n vddval, '11n-t' vddval)


*************************************************

.tran 10p 50n
.measure tran stpow avg power from=0n to=50n

.measure tran tpcout1 trig v(B) td=990p val=vddval_2 cross=1 targ v(coutb) td=990p val=vddval_2 cross=1
.measure tran tpcout2 trig v(C) td=1.9n val=vddval_2 cross=1 targ v(coutb) td=1.9n val=vddval_2 cross=1
.measure tran tpcout3 trig v(A) td=2.8n val=vddval_2 cross=1 targ v(coutb) td=2.8n val=vddval_2 cross=1
.measure tran tpcout4 trig v(B) td=3.8n val=vddval_2 cross=1 targ v(coutb) td=3.8n val=vddval_2 cross=1
.measure tran tpcout5 trig v(C) td=4.8n val=vddval_2 cross=1 targ v(coutb) td=4.8n val=vddval_2 cross=1
.measure tran tpcout6 trig v(A) td=5.8n val=vddval_2 cross=1 targ v(coutb) td=5.8n val=vddval_2 cross=1
.measure tran tpcout7 trig v(B) td=6.8n val=vddval_2 cross=1 targ v(coutb) td=6.8n val=vddval_2 cross=1
.measure tran tpcout8 trig v(A) td=8.8n val=vddval_2 cross=1 targ v(coutb) td=8.8n val=vddval_2 cross=1
.measure tran tpcout9 trig v(A) td=9.8n val=vddval_2 cross=1 targ v(coutb) td=9.8n val=vddval_2 cross=1
.op
.end

