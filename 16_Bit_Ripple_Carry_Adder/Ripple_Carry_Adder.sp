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

mp1	n1		B	vdd	vdd	pmos	l=100n	w=600n
mp2	n1		A	vdd	vdd	pmos	l=100n	w=600n
mp3	n2		A	vdd	vdd	pmos	l=100n	w=600n
mp4	coutb	C	n1	vdd	pmos	l=100n	w=600n
mp5	coutb	B	n2	vdd	pmos	l=100n	w=600n

mn1	coutb	C	n3	gnd	nmos	l=100n	w=240n
mn2	coutb	B	n4	gnd	nmos	l=100n	w=240n
mn3	n3		B	gnd	gnd	nmos	l=100n	w=240n
mn4	n3		A	gnd	gnd	nmos	l=100n	w=240n
mn5	n4		A	gnd	gnd	nmos	l=100n	w=240n


mp6	n5		C	vdd	vdd	pmos	l=100n	w=600n
mp7	n5		A	vdd	vdd	pmos	l=100n	w=600n
mp8	n5		B	vdd	vdd	pmos	l=100n	w=600n
mp9	sumb	coutb	n5	vdd	pmos	l=100n	w=600n

mn6	sumb	coutb	n6	gnd	nmos	l=100n	w=240n
mn7	n6		C	gnd	gnd	nmos	l=100n	w=240n
mn8	n6		A	gnd	gnd	nmos	l=100n	w=240n
mn9	n6		B	gnd	gnd	nmos	l=100n	w=240n


mp10	n7		A	vdd	vdd	pch_hvt	l=100n	w=900n
mp11	n8		B	n7	vdd	pch_hvt	l=100n	w=900n
mp12	sumb	C	n8	vdd	pch_hvt	l=100n	w=900n

mn10	sumb	C	n9	gnd	nch_hvt	l=100n	w=360n
mn11	n9		B	n10	gnd	nch_hvt	l=100n	w=360n
mn12	n10		A	gnd	gnd	nch_hvt	l=100n	w=360n

mp13	cout	coutb	vdd	vdd	pch_hvt	l=100n	w=300n

mn13	cout	coutb	gnd	gnd	nch_hvt	l=100n	w=120n

mp14	sum	sumb	vdd	vdd	pch_hvt	l=100n	w=300n

mn14	sum	sumb	gnd	gnd	nch_hvt	l=100n	w=120n

***************************************************

vdd	vdd	gnd	vddval

*VinA	A	gnd	dc	vddval
*VinB	B	gnd	dc	vddval
*VinC	C	gnd	dc	vddval

Vina A 0 PWL(0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval,
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0, 
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0)

Vinb B 0 PWL( 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0)

Vinc C 0 PWL( 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0)

*************************************************

.tran 10p 70n
.measure tran av_pow avg power from=0n to=70n

.measure	tran	tpcoutb1		trig	v(B)	td=7.6n 	val=vddval_2	cross=1	targ v(coutb)	td=7.6n 	val=vddval_2	cross=1
.measure	tran	tpcoutb2		trig	v(B)	td=12.6n	val=vddval_2	cross=1	targ v(coutb)	td=12.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb3		trig	v(C)	td=14.6n	val=vddval_2	cross=1	targ v(coutb)	td=14.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb4		trig	v(C)	td=16.6n	val=vddval_2	cross=1	targ v(coutb)	td=16.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb5		trig	v(C)	td=17.7n	val=vddval_2	cross=1	targ v(coutb)	td=17.7n	val=vddval_2	cross=1
.measure	tran	tpcoutb6		trig	v(B)	td=18.6n	val=vddval_2	cross=1	targ v(coutb)	td=18.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb7		trig	v(B)	td=19.6n	val=vddval_2	cross=1	targ v(coutb)	td=19.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb8		trig	v(A)	td=20.6n	val=vddval_2	cross=1	targ v(coutb)	td=20.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb9		trig	v(A)	td=21.6n	val=vddval_2	cross=1	targ v(coutb)	td=21.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb10		trig 	v(A) 	td=22.6n 	val=vddval_2	cross=1	targ v(coutb)	td=22.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb11		trig 	v(A) 	td=23.6n 	val=vddval_2	cross=1	targ v(coutb)	td=23.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb12		trig 	v(A) 	td=24.6n 	val=vddval_2	cross=1	targ v(coutb)	td=24.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb13		trig 	v(B) 	td=30.6n 	val=vddval_2	cross=1	targ v(coutb)	td=30.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb14		trig 	v(C) 	td=34.6n 	val=vddval_2	cross=1	targ v(coutb)	td=34.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb15		trig 	v(C) 	td=35.6n 	val=vddval_2	cross=1	targ v(coutb)	td=35.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb16		trig 	v(C) 	td=37.6n 	val=vddval_2	cross=1	targ v(coutb)	td=37.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb17		trig 	v(C) 	td=38.6n 	val=vddval_2	cross=1	targ v(coutb)	td=38.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb18		trig 	v(A) 	td=41.6n 	val=vddval_2	cross=1	targ v(coutb)	td=41.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb19		trig 	v(A) 	td=42.6n 	val=vddval_2	cross=1	targ v(coutb)	td=42.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb20		trig 	v(A) 	td=43.6n 	val=vddval_2	cross=1	targ v(coutb)	td=43.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb21		trig 	v(A) 	td=44.6n 	val=vddval_2	cross=1	targ v(coutb)	td=44.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb22		trig 	v(A) 	td=45.6n 	val=vddval_2	cross=1	targ v(coutb)	td=45.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb23		trig 	v(A) 	td=46.6n 	val=vddval_2	cross=1	targ v(coutb)	td=46.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb24		trig 	v(A) 	td=50.6n 	val=vddval_2	cross=1	targ v(coutb)	td=50.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb25		trig 	v(A) 	td=55.6n 	val=vddval_2	cross=1	targ v(coutb)	td=55.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb26		trig 	v(A) 	td=57.6n 	val=vddval_2	cross=1	targ v(coutb)	td=57.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb27		trig 	v(A) 	td=58.6n 	val=vddval_2	cross=1	targ v(coutb)	td=58.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb28		trig 	v(A) 	td=59.6n 	val=vddval_2	cross=1	targ v(coutb)	td=59.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb29		trig 	v(A) 	td=60.6n 	val=vddval_2	cross=1	targ v(coutb)	td=60.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb30		trig 	v(A) 	td=61.6n 	val=vddval_2	cross=1	targ v(coutb)	td=61.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb31		trig 	v(A) 	td=63.6n 	val=vddval_2	cross=1	targ v(coutb)	td=63.6n	val=vddval_2	cross=1
.measure	tran	tpcoutb32		trig 	v(A) 	td=68.6n 	val=vddval_2	cross=1	targ v(coutb)	td=68.6n	val=vddval_2	cross=1



.measure	tran	tpcout1		trig	v(B)	td=7.6n 	val=vddval_2	cross=1	targ v(cout)	td=7.6n 	val=vddval_2	cross=1
.measure	tran	tpcout2		trig	v(B)	td=12.6n	val=vddval_2	cross=1	targ v(cout)	td=12.6n	val=vddval_2	cross=1
.measure	tran	tpcout3		trig	v(C)	td=14.6n	val=vddval_2	cross=1	targ v(cout)	td=14.6n	val=vddval_2	cross=1
.measure	tran	tpcout4		trig	v(C)	td=16.6n	val=vddval_2	cross=1	targ v(cout)	td=16.6n	val=vddval_2	cross=1
.measure	tran	tpcout5		trig	v(C)	td=17.7n	val=vddval_2	cross=1	targ v(cout)	td=17.7n	val=vddval_2	cross=1
.measure	tran	tpcout6		trig	v(B)	td=18.6n	val=vddval_2	cross=1	targ v(cout)	td=18.6n	val=vddval_2	cross=1
.measure	tran	tpcout7		trig	v(B)	td=19.6n	val=vddval_2	cross=1	targ v(cout)	td=19.6n	val=vddval_2	cross=1
.measure	tran	tpcout8		trig	v(A)	td=20.6n	val=vddval_2	cross=1	targ v(cout)	td=20.6n	val=vddval_2	cross=1
.measure	tran	tpcout9		trig	v(A)	td=21.6n	val=vddval_2	cross=1	targ v(cout)	td=21.6n	val=vddval_2	cross=1
.measure	tran	tpcout10	trig 	v(A) 	td=22.6n 	val=vddval_2	cross=1	targ v(cout)	td=22.6n	val=vddval_2	cross=1
.measure	tran	tpcout11	trig 	v(A) 	td=23.6n 	val=vddval_2	cross=1	targ v(cout)	td=23.6n	val=vddval_2	cross=1
.measure	tran	tpcout12	trig 	v(A) 	td=24.6n 	val=vddval_2	cross=1	targ v(cout)	td=24.6n	val=vddval_2	cross=1
.measure	tran	tpcout13	trig 	v(B) 	td=30.6n 	val=vddval_2	cross=1	targ v(cout)	td=30.6n	val=vddval_2	cross=1
.measure	tran	tpcout14	trig 	v(C) 	td=34.6n 	val=vddval_2	cross=1	targ v(cout)	td=34.6n	val=vddval_2	cross=1
.measure	tran	tpcout15	trig 	v(C) 	td=35.6n 	val=vddval_2	cross=1	targ v(cout)	td=35.6n	val=vddval_2	cross=1
.measure	tran	tpcout16	trig 	v(C) 	td=37.6n 	val=vddval_2	cross=1	targ v(cout)	td=37.6n	val=vddval_2	cross=1
.measure	tran	tpcout17	trig 	v(C) 	td=38.6n 	val=vddval_2	cross=1	targ v(cout)	td=38.6n	val=vddval_2	cross=1
.measure	tran	tpcout18	trig 	v(A) 	td=41.6n 	val=vddval_2	cross=1	targ v(cout)	td=41.6n	val=vddval_2	cross=1
.measure	tran	tpcout19	trig 	v(A) 	td=42.6n 	val=vddval_2	cross=1	targ v(cout)	td=42.6n	val=vddval_2	cross=1
.measure	tran	tpcout20	trig 	v(A) 	td=43.6n 	val=vddval_2	cross=1	targ v(cout)	td=43.6n	val=vddval_2	cross=1
.measure	tran	tpcout21	trig 	v(A) 	td=44.6n 	val=vddval_2	cross=1	targ v(cout)	td=44.6n	val=vddval_2	cross=1
.measure	tran	tpcout22	trig 	v(A) 	td=45.6n 	val=vddval_2	cross=1	targ v(cout)	td=45.6n	val=vddval_2	cross=1
.measure	tran	tpcout23	trig 	v(A) 	td=46.6n 	val=vddval_2	cross=1	targ v(cout)	td=46.6n	val=vddval_2	cross=1
.measure	tran	tpcout24	trig 	v(A) 	td=50.6n 	val=vddval_2	cross=1	targ v(cout)	td=50.6n	val=vddval_2	cross=1
.measure	tran	tpcout25	trig 	v(A) 	td=55.6n 	val=vddval_2	cross=1	targ v(cout)	td=55.6n	val=vddval_2	cross=1
.measure	tran	tpcout26	trig 	v(A) 	td=57.6n 	val=vddval_2	cross=1	targ v(cout)	td=57.6n	val=vddval_2	cross=1
.measure	tran	tpcout27	trig 	v(A) 	td=58.6n 	val=vddval_2	cross=1	targ v(cout)	td=58.6n	val=vddval_2	cross=1
.measure	tran	tpcout28	trig 	v(A) 	td=59.6n 	val=vddval_2	cross=1	targ v(cout)	td=59.6n	val=vddval_2	cross=1
.measure	tran	tpcout29	trig 	v(A) 	td=60.6n 	val=vddval_2	cross=1	targ v(cout)	td=60.6n	val=vddval_2	cross=1
.measure	tran	tpcout30	trig 	v(A) 	td=61.6n 	val=vddval_2	cross=1	targ v(cout)	td=61.6n	val=vddval_2	cross=1
.measure	tran	tpcout31	trig 	v(A) 	td=63.6n 	val=vddval_2	cross=1	targ v(cout)	td=63.6n	val=vddval_2	cross=1
.measure	tran	tpcout32	trig 	v(A) 	td=68.6n 	val=vddval_2	cross=1	targ v(cout)	td=68.6n	val=vddval_2	cross=1




.measure	tran	tpsum1		trig	v(C)	td=990p		val=vddval_2	cross=1	targ v(sum)	td=990p		val=vddval_2	cross=1
.measure	tran	tpsum2		trig	v(C)	td=1.5n		val=vddval_2	cross=1	targ v(sum)	td=1.5n		val=vddval_2	cross=1
.measure	tran	tpsum3		trig	v(B)	td=2.5n		val=vddval_2	cross=1	targ v(sum)	td=2.5n		val=vddval_2	cross=1
.measure	tran	tpsum4		trig	v(B)	td=4.5n		val=vddval_2	cross=1	targ v(sum)	td=4.5n		val=vddval_2	cross=1
.measure	tran	tpsum5		trig	v(A)	td=5.5n		val=vddval_2	cross=1	targ v(sum)	td=5.5n		val=vddval_2	cross=1
.measure	tran	tpsum6		trig	v(B)	td=7.5n		val=vddval_2	cross=1	targ v(sum)	td=7.5n		val=vddval_2	cross=1
.measure	tran	tpsum7		trig	v(C)	td=9.5n		val=vddval_2	cross=1	targ v(sum)	td=9.5n		val=vddval_2	cross=1
.measure	tran	tpsum8		trig	v(C)	td=11.5n	val=vddval_2	cross=1	targ v(sum)	td=11.5n	val=vddval_2	cross=1
.measure	tran	tpsum9		trig	v(B)	td=12.5n	val=vddval_2	cross=1	targ v(sum)	td=12.5n	val=vddval_2	cross=1
.measure	tran	tpsum10		trig	v(A)	td=13.5n	val=vddval_2	cross=1	targ v(sum)	td=13.5n	val=vddval_2	cross=1
.measure	tran	tpsum11		trig	v(C)	td=16.5n	val=vddval_2	cross=1	targ v(sum)	td=16.5n	val=vddval_2	cross=1
.measure	tran	tpsum12		trig	v(C)	td=17.5n	val=vddval_2	cross=1	targ v(sum)	td=17.5n	val=vddval_2	cross=1
.measure	tran	tpsum13		trig	v(C)	td=21.5n	val=vddval_2	cross=1	targ v(sum)	td=21.5n	val=vddval_2	cross=1
.measure	tran	tpsum14		trig	v(A)	td=23.5n	val=vddval_2	cross=1	targ v(sum)	td=23.5n	val=vddval_2	cross=1
.measure	tran	tpsum15		trig	v(B)	td=24.5n	val=vddval_2	cross=1	targ v(sum)	td=24.5n	val=vddval_2	cross=1
.measure	tran	tpsum16		trig	v(B)	td=30.5n	val=vddval_2	cross=1	targ v(sum)	td=30.5n	val=vddval_2	cross=1
.measure	tran	tpsum17		trig	v(A)	td=31.5n	val=vddval_2	cross=1	targ v(sum)	td=31.5n	val=vddval_2	cross=1
.measure	tran	tpsum18		trig	v(C)	td=35.5n	val=vddval_2	cross=1	targ v(sum)	td=35.5n	val=vddval_2	cross=1
.measure	tran	tpsum19		trig	v(A)	td=39.5n	val=vddval_2	cross=1	targ v(sum)	td=39.5n	val=vddval_2	cross=1
.measure	tran	tpsum20		trig	v(A)	td=41.5n	val=vddval_2	cross=1	targ v(sum)	td=41.5n	val=vddval_2	cross=1
.measure	tran	tpsum21		trig	v(A)	td=44.5n	val=vddval_2	cross=1	targ v(sum)	td=44.5n	val=vddval_2	cross=1
.measure	tran	tpsum22		trig	v(C)	td=50.5n	val=vddval_2	cross=1	targ v(sum)	td=50.5n	val=vddval_2	cross=1
.measure	tran	tpsum23		trig	v(C)	td=55.5n	val=vddval_2	cross=1	targ v(sum)	td=55.5n	val=vddval_2	cross=1
.measure	tran	tpsum24		trig	v(A)	td=57.5n	val=vddval_2	cross=1	targ v(sum)	td=57.5n	val=vddval_2	cross=1
.measure	tran	tpsum25		trig	v(B)	td=58.5n	val=vddval_2	cross=1	targ v(sum)	td=58.5n	val=vddval_2	cross=1
.measure	tran	tpsum26		trig	v(C)	td=59.5n	val=vddval_2	cross=1	targ v(sum)	td=59.5n	val=vddval_2	cross=1
.measure	tran	tpsum27		trig	v(B)	td=64.5n	val=vddval_2	cross=1	targ v(sum)	td=64.5n	val=vddval_2	cross=1
.measure	tran	tpsum28		trig	v(B)	td=65.5n	val=vddval_2	cross=1	targ v(sum)	td=65.5n	val=vddval_2	cross=1
.measure	tran	tpsum29		trig	v(B)	td=66.5n	val=vddval_2	cross=1	targ v(sum)	td=66.5n	val=vddval_2	cross=1
.measure	tran	tpsum30		trig	v(B)	td=67.5n	val=vddval_2	cross=1	targ v(sum)	td=67.5n	val=vddval_2	cross=1
.measure	tran	tpsum31		trig	v(B)	td=68.5n	val=vddval_2	cross=1	targ v(sum)	td=68.5n	val=vddval_2	cross=1
	


.measure	tran	tpsumb1			trig	v(C)	td=990p		val=vddval_2	cross=1	targ v(sumb)	td=990p		val=vddval_2	cross=1
.measure	tran	tpsumb2			trig	v(C)	td=1.5n		val=vddval_2	cross=1	targ v(sumb)	td=1.5n		val=vddval_2	cross=1
.measure	tran	tpsumb3			trig	v(B)	td=2.5n		val=vddval_2	cross=1	targ v(sumb)	td=2.5n		val=vddval_2	cross=1
.measure	tran	tpsumb4			trig	v(B)	td=4.5n		val=vddval_2	cross=1	targ v(sumb)	td=4.5n		val=vddval_2	cross=1
.measure	tran	tpsumb5			trig	v(A)	td=5.5n		val=vddval_2	cross=1	targ v(sumb)	td=5.5n		val=vddval_2	cross=1
.measure	tran	tpsumb6			trig	v(B)	td=7.5n		val=vddval_2	cross=1	targ v(sumb)	td=7.5n		val=vddval_2	cross=1
.measure	tran	tpsumb7			trig	v(C)	td=9.5n		val=vddval_2	cross=1	targ v(sumb)	td=9.5n		val=vddval_2	cross=1
.measure	tran	tpsumb8			trig	v(C)	td=11.5n	val=vddval_2	cross=1	targ v(sumb)	td=11.5n	val=vddval_2	cross=1
.measure	tran	tpsumb9			trig	v(B)	td=12.5n	val=vddval_2	cross=1	targ v(sumb)	td=12.5n	val=vddval_2	cross=1
.measure	tran	tpsumb10		trig	v(A)	td=13.5n	val=vddval_2	cross=1	targ v(sumb)	td=13.5n	val=vddval_2	cross=1
.measure	tran	tpsumb11		trig	v(C)	td=16.5n	val=vddval_2	cross=1	targ v(sumb)	td=16.5n	val=vddval_2	cross=1
.measure	tran	tpsumb12		trig	v(C)	td=17.5n	val=vddval_2	cross=1	targ v(sumb)	td=17.5n	val=vddval_2	cross=1
.measure	tran	tpsumb13		trig	v(C)	td=21.5n	val=vddval_2	cross=1	targ v(sumb)	td=21.5n	val=vddval_2	cross=1
.measure	tran	tpsumb14		trig	v(A)	td=23.5n	val=vddval_2	cross=1	targ v(sumb)	td=23.5n	val=vddval_2	cross=1
.measure	tran	tpsumb15		trig	v(B)	td=24.5n	val=vddval_2	cross=1	targ v(sumb)	td=24.5n	val=vddval_2	cross=1
.measure	tran	tpsumb16		trig	v(B)	td=30.5n	val=vddval_2	cross=1	targ v(sumb)	td=30.5n	val=vddval_2	cross=1
.measure	tran	tpsumb17		trig	v(A)	td=31.5n	val=vddval_2	cross=1	targ v(sumb)	td=31.5n	val=vddval_2	cross=1
.measure	tran	tpsumb18		trig	v(C)	td=35.5n	val=vddval_2	cross=1	targ v(sumb)	td=35.5n	val=vddval_2	cross=1
.measure	tran	tpsumb19		trig	v(A)	td=39.5n	val=vddval_2	cross=1	targ v(sumb)	td=39.5n	val=vddval_2	cross=1
.measure	tran	tpsumb20		trig	v(A)	td=41.5n	val=vddval_2	cross=1	targ v(sumb)	td=41.5n	val=vddval_2	cross=1
.measure	tran	tpsumb21		trig	v(A)	td=44.5n	val=vddval_2	cross=1	targ v(sumb)	td=44.5n	val=vddval_2	cross=1
.measure	tran	tpsumb22		trig	v(C)	td=50.5n	val=vddval_2	cross=1	targ v(sumb)	td=50.5n	val=vddval_2	cross=1
.measure	tran	tpsumb23		trig	v(C)	td=55.5n	val=vddval_2	cross=1	targ v(sumb)	td=55.5n	val=vddval_2	cross=1
.measure	tran	tpsumb24		trig	v(A)	td=57.5n	val=vddval_2	cross=1	targ v(sumb)	td=57.5n	val=vddval_2	cross=1
.measure	tran	tpsumb25		trig	v(B)	td=58.5n	val=vddval_2	cross=1	targ v(sumb)	td=58.5n	val=vddval_2	cross=1
.measure	tran	tpsumb26		trig	v(C)	td=59.5n	val=vddval_2	cross=1	targ v(sumb)	td=59.5n	val=vddval_2	cross=1
.measure	tran	tpsumb27		trig	v(B)	td=64.5n	val=vddval_2	cross=1	targ v(sumb)	td=64.5n	val=vddval_2	cross=1
.measure	tran	tpsumb28		trig	v(B)	td=65.5n	val=vddval_2	cross=1	targ v(sumb)	td=65.5n	val=vddval_2	cross=1
.measure	tran	tpsumb29		trig	v(B)	td=66.5n	val=vddval_2	cross=1	targ v(sumb)	td=66.5n	val=vddval_2	cross=1
.measure	tran	tpsumb30		trig	v(B)	td=67.5n	val=vddval_2	cross=1	targ v(sumb)	td=67.5n	val=vddval_2	cross=1
.measure	tran	tpsumb31		trig	v(B)	td=68.5n	val=vddval_2	cross=1	targ v(sumb)	td=68.5n	val=vddval_2	cross=1


.measure tran tp param=72.39p
.measure tran pdp param='tp*av_pow'


.op
.end

