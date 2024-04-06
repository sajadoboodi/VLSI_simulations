16_bit_Ripple_Carry_Adder
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

.SUBCKT fulladder A B C cout sum

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


mp6	n5		C	vdd	vdd	pch_hvt	l=100n	w=600n
mp7	n5		A	vdd	vdd	pch_hvt	l=100n	w=600n
mp8	n5		B	vdd	vdd	pch_hvt	l=100n	w=600n
mp9	sumb	coutb	n5	vdd	pch_hvt	l=100n	w=600n

mn6	sumb	coutb	n6	gnd	nch_hvt	l=100n	w=240n
mn7	n6		C	gnd	gnd	nch_hvt	l=100n	w=240n
mn8	n6		A	gnd	gnd	nch_hvt	l=100n	w=240n
mn9	n6		B	gnd	gnd	nch_hvt	l=100n	w=240n


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

.ends fulladder

***************************************************


Xf1		A1	B1	C0	C1	S1	fulladder
Xf2		A2	B2	C1	C2	S2	fulladder
Xf3		A3	B3	C2	C3	S3	fulladder
Xf4		A4	B4	C3	C4	S4	fulladder
Xf5		A5	B5	C4	C5	S5	fulladder
Xf6		A6	B6	C5	C6	S6	fulladder
Xf7		A7	B7	C6	C7	S7	fulladder
Xf8		A8	B8	C7	C8	S8	fulladder
Xf9		A9	B9	C8	C9	S9	fulladder
Xf10	A10	B10	C9	C10	S10	fulladder
Xf11	A11	B11	C10	C11	S11	fulladder
Xf12	A12	B12	C11	C12	S12	fulladder
Xf13	A13	B13	C12	C13	S13	fulladder
Xf14	A14	B14	C13	C14	S14	fulladder
Xf15	A15	B15	C14	C15	S15	fulladder
Xf16	A16	B16	C15	C16	S16	fulladder


***************************************************

vdd	vdd	gnd	vddval


*Vinc0	C0	0	PWL(0n	0,	'1n-t'	0,	1n	vddval,	'2n-t'	vddval,	2n	0,	'3n-t'	0,	3n	0,	'4n-t'	0,	5n	vddval,	'6n-t'	vddval)
*Vina1	A1	0	PWL(0n	0,	'1n-t'	0,	1n	vddval,	'2n-t'	vddval,	2n	0,	'3n-t'	0,	3n	vddval,	'4n-t'	vddval,	5n	0,	'6n-t'	0)
*Vinb1	B1	0	PWL(0n	0,	'1n-t'	0,	1n	vddval,	'2n-t'	vddval,	2n	0,	'3n-t'	0,	3n	0,	'4n-t'	0,	5n	vddval,	'6n-t'	vddval)
*

Vinc0 C0 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vina1 A1 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb1 B1 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0



Vina2 A2 0 PWL 0n vddval, '6n-t' vddval, 6n 0, '14n-t' 0, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n 0, '25n-t' 0, 25n vddval  , '26n-t' vddval  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n vddval  , '57n-t' vddval  , 57n 0, '58n-t' 0, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb2 B2 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina3 A3 0 PWL 0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n vddval, '10n-t' vddval, 10n 0, '12n-t' 0, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n 0, '25n-t' 0, 25n vddval, 
+ '27n-t' vddval, 27n 0, '29n-t' 0, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n vddval, '39n-t' vddval, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n 0, '44n-t' 0, 44n vddval, 
+ '45n-t' vddval, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vinb3 B3 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina4 A4 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vinb4 B4 0 PWL 0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n vddval, '10n-t' vddval, 10n 0, '12n-t' 0, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n 0, '25n-t' 0, 25n vddval, 
+ '27n-t' vddval, 27n 0, '29n-t' 0, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n vddval, '39n-t' vddval, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n 0, '44n-t' 0, 44n vddval, 
+ '45n-t' vddval, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vina5 A5 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb5 B5 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina6 A6 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vinb6 B6 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vina7 A7 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vinb7 B7 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vina8 A8 0 PWL 0n vddval, '6n-t' vddval, 6n 0, '14n-t' 0, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n 0, '25n-t' 0, 25n vddval  , '26n-t' vddval  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n vddval  , '57n-t' vddval  , 57n 0, '58n-t' 0, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb8 B8 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina9 A9 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vinb9 B9 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vina10 A10 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0

Vinb10 B10 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vina11 A11 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vinb11 B11 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vina12 A12 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vinb12 B12 0 PWL 0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n vddval, '10n-t' vddval, 10n 0, '12n-t' 0, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n 0, '25n-t' 0, 25n vddval, 
+ '27n-t' vddval, 27n 0, '29n-t' 0, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n vddval, '39n-t' vddval, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n 0, '44n-t' 0, 44n vddval, 
+ '45n-t' vddval, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0

Vina13 A13 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vinb13 B13 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n 0, '45n-t' 0, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina14 A14 0 PWL 0n 0, '6n-t' 0, 6n vddval, '14n-t' vddval, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n vddval, '25n-t' vddval, 25n 0  , '26n-t' 0  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n 0  , '57n-t' 0  , 57n vddval, '58n-t' vddval, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb14 B14 0 PWL 0n 0, '1n-t' 0, 1n vddval, '2n-t' vddval, 2n 0, '10n-t' 0, 10n vddval, '12n-t' vddval, 12n 0, '15n-t' 0, 15n vddval, 
+ '17n-t' vddval, 17n 0, '18n-t' 0, 18n vddval, '19n-t' vddval, 19n 0, '22n-t' 0, 22n vddval, '25n-t' vddval, 25n 0, 
+ '27n-t' 0, 27n vddval, '29n-t' vddval, 29n 0, '30n-t' 0, 30n vddval, '35n-t' vddval, 35n 0, '36n-t' 0, 36n vddval, 
+ '38n-t' vddval, 38n 0, '39n-t' 0, 39n vddval, '41n-t' vddval, 41n 0, '43n-t' 0, 43n vddval, '44n-t' vddval, 44n 0, 
+ '45n-t' 0, 45n vddval, '46n-t' vddval, 46n 0, '47n-t' 0, 47n vddval, '48n-t' vddval, 48n 0,  '49n-t' 0, 49n vddval, 
+ '51n-t' vddval, 51n 0, '52n-t' 0, 52n vddval, '53n-t' vddval, 53n 0, '56n-t' 0, 56n vddval, '59n-t' vddval, 59n 0, 
+ '60n-t' 0, 60n vddval, '62n-t' vddval, 62n 0, '64n-t' 0, 64n vddval, '69n-t' vddval, 69n 0


Vina15 A15 0 PWL 0n vddval, '6n-t' vddval, 6n 0, '14n-t' 0, 14n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, 
+ '23n-t' vddval, 23n 0  , '24n-t' 0  , 24n 0, '25n-t' 0, 25n vddval  , '26n-t' vddval  , 26n vddval, '27n-t' vddval, 27n 0,  
+ '32n-t' 0  , 32n vddval, '40n-t' vddval, 40n 0  , '41n-t' 0  , 41n vddval, '42n-t' vddval, 42n 0  , '43n-t' 0, 43n vddval, 
+ '44n-t' vddval, 44n 0  , '45n-t' 0  , 45n vddval, '46n-t' vddval, 46n 0  , '47n-t' 0  , 47n vddval, '50n-t' vddval, 50n 0,
+ '51n-t' 0  , 51n vddval, '52n-t' vddval, 52n 0  , '53n-t' 0  , 53n vddval, '54n-t' vddval, 54n 0  , '55n-t' 0, 55n vddval, 
+ '56n-t' vddval, 56n vddval  , '57n-t' vddval  , 57n 0, '58n-t' 0, 58n 0  , '59n-t' 0  , 59n vddval, '60n-t' vddval, 60n 0,
+ '61n-t' 0  , 61n vddval, '62n-t' vddval, 62n 0  , '64n-t' 0  , 64n vddval, '69n-t' vddval, 69n 0


Vinb15 B15 0 PWL 0n 0, '3n-t' 0, 3n vddval, '5n-t' vddval, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0


Vina16 A16 0 PWL 0n 0, '3n-t' 0, 3n 0, '5n-t' 0, 5n vddval, '8n-t' vddval, 8n vddval, '13n-t' vddval, 13n 0, '15n-t' 0, 15n vddval, 
+ '19n-t' vddval, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n vddval, 
+ '35n-t' vddval, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n 0, '51n-t' 0, 51n vddval, '54n-t' vddval, 54n 0, '55n-t' 0, 55n vddval, '56n-t' vddval, 56n 0, 
+ '57n-t' 0, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n 0, '65n-t' 0, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n vddval, '68n-t' vddval, 68n 0, '69n-t' 0, 69n 0


Vinb16 B16 0 PWL 0n vddval, '3n-t' vddval, 3n 0, '5n-t' 0, 5n 0, '8n-t' 0, 8n vddval, '13n-t' vddval, 13n vddval, '15n-t' vddval, 15n 0, 
+ '19n-t' 0, 19n 0, '20n-t' 0, 20n vddval, '21n-t' vddval, 21n 0, '22n-t' 0, 22n vddval, '23n-t' vddval, 23n 0, 
+ '25n-t' 0, 25n vddval, '26n-t' vddval, 26n 0, '29n-t' 0, 29n vddval, '30n-t' vddval, 30n 0, '31n-t' 0, 31n 0, 
+ '35n-t' 0, 35n 0, '39n-t' 0, 39n vddval, '45n-t' vddval, 45n 0, '48n-t' 0, 48n vddval, '49n-t' vddval, 49n 0, 
+ '50n-t' 0, 50n vddval, '51n-t' vddval, 51n 0, '54n-t' 0, 54n vddval, '55n-t' vddval, 55n 0, '56n-t' 0, 56n vddval, 
+ '57n-t' vddval, 57n 0, '59n-t' 0, 59n vddval, '60n-t' vddval, 60n 0, '61n-t' 0, 61n vddval, '65n-t' vddval, 65n 0
+ '66n-t' 0, 66n vddval, '67n-t' vddval, 67n 0, '68n-t' 0, 68n vddval, '69n-t' vddval, 69n 0

*************************************************

.tran 10p 70n
.measure tran av_pow avg power from=0n to=70n


.measure	tran	tpcout1			trig	v(A12)	td=7.8n 	val=vddval_2	cross=1	targ v(C16)	td=7.8n 	val=vddval_2	cross=1
.measure	tran	tpcout2			trig	v(A16)	td=12.8n 	val=vddval_2	cross=1	targ v(C16)	td=12.8n 	val=vddval_2	cross=1
.measure	tran	tpcout3			trig	v(A16)	td=14.8n 	val=vddval_2	cross=1	targ v(C16)	td=14.8n 	val=vddval_2	cross=1
.measure	tran	tpcout4			trig	v(A13)	td=16.8n 	val=vddval_2	cross=1	targ v(C16)	td=16.8n 	val=vddval_2	cross=1
.measure	tran	tpcout5			trig	v(A13)	td=17.8n 	val=vddval_2	cross=1	targ v(C16)	td=17.8n 	val=vddval_2	cross=1
.measure	tran	tpcout6			trig	v(A13)	td=18.8n 	val=vddval_2	cross=1	targ v(C16)	td=18.8n 	val=vddval_2	cross=1
.measure	tran	tpcout7			trig	v(A16)	td=19.8n 	val=vddval_2	cross=1	targ v(C16)	td=19.8n 	val=vddval_2	cross=1
.measure	tran	tpcout8			trig	v(A16)	td=20.8n 	val=vddval_2	cross=1	targ v(C16)	td=20.8n 	val=vddval_2	cross=1
.measure	tran	tpcout9			trig	v(A16)	td=21.8n 	val=vddval_2	cross=1	targ v(C16)	td=21.8n 	val=vddval_2	cross=1
.measure	tran	tpcout10		trig	v(A16)	td=22.8n 	val=vddval_2	cross=1	targ v(C16)	td=22.8n 	val=vddval_2	cross=1
.measure	tran	tpcout11		trig	v(A16)	td=24.8n 	val=vddval_2	cross=1	targ v(C16)	td=24.8n 	val=vddval_2	cross=1
.measure	tran	tpcout12		trig	v(A16)	td=25.8n 	val=vddval_2	cross=1	targ v(C16)	td=25.8n 	val=vddval_2	cross=1
.measure	tran	tpcout13		trig	v(A16)	td=28.8n 	val=vddval_2	cross=1	targ v(C16)	td=28.8n 	val=vddval_2	cross=1
.measure	tran	tpcout14		trig	v(A16)	td=29.8n 	val=vddval_2	cross=1	targ v(C16)	td=29.8n 	val=vddval_2	cross=1
.measure	tran	tpcout15		trig	v(A16)	td=30.8n 	val=vddval_2	cross=1	targ v(C16)	td=30.8n 	val=vddval_2	cross=1
.measure	tran	tpcout16		trig	v(A16)	td=34.8n 	val=vddval_2	cross=1	targ v(C16)	td=34.8n 	val=vddval_2	cross=1
.measure	tran	tpcout17		trig	v(A16)	td=44.8n 	val=vddval_2	cross=1	targ v(C16)	td=44.8n 	val=vddval_2	cross=1
.measure	tran	tpcout18		trig	v(A16)	td=47.8n 	val=vddval_2	cross=1	targ v(C16)	td=47.8n 	val=vddval_2	cross=1
.measure	tran	tpcout19		trig	v(A16)	td=48.8n 	val=vddval_2	cross=1	targ v(C16)	td=48.8n 	val=vddval_2	cross=1
.measure	tran	tpcout20		trig	v(A15)	td=49.8n 	val=vddval_2	cross=1	targ v(C16)	td=49.8n 	val=vddval_2	cross=1
.measure	tran	tpcout21		trig	v(A15)	td=50.8n 	val=vddval_2	cross=1	targ v(C16)	td=50.8n 	val=vddval_2	cross=1
.measure	tran	tpcout22		trig	v(A14)	td=55.5n 	val=vddval_2	cross=1	targ v(C16)	td=55.5n 	val=vddval_2	cross=1
.measure	tran	tpcout23		trig	v(A14)	td=56.5n 	val=vddval_2	cross=1	targ v(C16)	td=56.5n 	val=vddval_2	cross=1
.measure	tran	tpcout24		trig	v(A16)	td=58.5n 	val=vddval_2	cross=1	targ v(C16)	td=58.5n 	val=vddval_2	cross=1
.measure	tran	tpcout25		trig	v(A16)	td=59.5n 	val=vddval_2	cross=1	targ v(C16)	td=59.5n 	val=vddval_2	cross=1
.measure	tran	tpcout26		trig	v(A15)	td=60.5n 	val=vddval_2	cross=1	targ v(C16)	td=60.5n 	val=vddval_2	cross=1
.measure	tran	tpcout27		trig	v(A15)	td=61.5n 	val=vddval_2	cross=1	targ v(C16)	td=61.5n 	val=vddval_2	cross=1
.measure	tran	tpcout28		trig	v(A15)	td=63.5n 	val=vddval_2	cross=1	targ v(C16)	td=63.5n 	val=vddval_2	cross=1
.measure	tran	tpcout29		trig	v(A15)	td=63.5n 	val=vddval_2	cross=1	targ v(C16)	td=63.5n 	val=vddval_2	cross=1
.measure	tran	tpcout30		trig	v(A12)	td=64.5n 	val=vddval_2	cross=1	targ v(C16)	td=64.5n 	val=vddval_2	cross=1
.measure	tran	tpcout31		trig	v(A12)	td=65.5n 	val=vddval_2	cross=1	targ v(C16)	td=65.5n 	val=vddval_2	cross=1


.measure	tran	tpsum1		trig	v(A13)	td=14.5n	val=vddval_2	cross=1	targ v(S16)	td=14.5n	val=vddval_2	cross=1
.measure	tran	tpsum2		trig	v(A13)	td=16.5n	val=vddval_2	cross=1	targ v(S16)	td=16.5n	val=vddval_2	cross=1
.measure	tran	tpsum3		trig	v(A13)	td=17.5n	val=vddval_2	cross=1	targ v(S16)	td=17.5n	val=vddval_2	cross=1
.measure	tran	tpsum4		trig	v(A12)	td=19.5n	val=vddval_2	cross=1	targ v(S16)	td=19.5n	val=vddval_2	cross=1
.measure	tran	tpsum5		trig	v(A12)	td=20.5n	val=vddval_2	cross=1	targ v(S16)	td=20.5n	val=vddval_2	cross=1
.measure	tran	tpsum6		trig	v(A12)	td=21.5n	val=vddval_2	cross=1	targ v(S16)	td=21.5n	val=vddval_2	cross=1
.measure	tran	tpsum7		trig	v(A12)	td=22.5n	val=vddval_2	cross=1	targ v(S16)	td=22.5n	val=vddval_2	cross=1
.measure	tran	tpsum8		trig	v(A12)	td=24.5n	val=vddval_2	cross=1	targ v(S16)	td=24.5n	val=vddval_2	cross=1
.measure	tran	tpsum9		trig	v(A12)	td=25.5n	val=vddval_2	cross=1	targ v(S16)	td=25.5n	val=vddval_2	cross=1
.measure	tran	tpsum10		trig	v(A3)	td=35.5n	val=vddval_2	cross=1	targ v(S16)	td=35.5n	val=vddval_2	cross=1
.measure	tran	tpsum11		trig	v(A4)	td=37.5n	val=vddval_2	cross=1	targ v(S16)	td=37.5n	val=vddval_2	cross=1
.measure	tran	tpsum12		trig	v(A16)	td=38.5n	val=vddval_2	cross=1	targ v(S16)	td=38.5n	val=vddval_2	cross=1
.measure	tran	tpsum13		trig	v(A15)	td=41.5n	val=vddval_2	cross=1	targ v(S16)	td=41.5n	val=vddval_2	cross=1
.measure	tran	tpsum14		trig	v(A15)	td=42.5n	val=vddval_2	cross=1	targ v(S16)	td=42.5n	val=vddval_2	cross=1
.measure	tran	tpsum15		trig	v(A15)	td=43.5n	val=vddval_2	cross=1	targ v(S16)	td=43.5n	val=vddval_2	cross=1
.measure	tran	tpsum16		trig	v(A15)	td=44.5n	val=vddval_2	cross=1	targ v(S16)	td=44.5n	val=vddval_2	cross=1
.measure	tran	tpsum17		trig	v(A15)	td=45.5n	val=vddval_2	cross=1	targ v(S16)	td=45.5n	val=vddval_2	cross=1
.measure	tran	tpsum18		trig	v(A15)	td=46.5n	val=vddval_2	cross=1	targ v(S16)	td=46.5n	val=vddval_2	cross=1
.measure	tran	tpsum19		trig	v(A15)	td=49.5n	val=vddval_2	cross=1	targ v(S16)	td=49.5n	val=vddval_2	cross=1
.measure	tran	tpsum20		trig	v(A15)	td=50.5n	val=vddval_2	cross=1	targ v(S16)	td=50.5n	val=vddval_2	cross=1
.measure	tran	tpsum21		trig	v(A14)	td=55.5n	val=vddval_2	cross=1	targ v(S16)	td=55.5n	val=vddval_2	cross=1
.measure	tran	tpsum22		trig	v(A15)	td=58.5n	val=vddval_2	cross=1	targ v(S16)	td=58.5n	val=vddval_2	cross=1
.measure	tran	tpsum23		trig	v(A15)	td=59.5n	val=vddval_2	cross=1	targ v(S16)	td=59.5n	val=vddval_2	cross=1
.measure	tran	tpsum24		trig	v(A15)	td=61.5n	val=vddval_2	cross=1	targ v(S16)	td=61.5n	val=vddval_2	cross=1
.measure	tran	tpsum25		trig	v(A15)	td=63.5n	val=vddval_2	cross=1	targ v(S16)	td=63.5n	val=vddval_2	cross=1
.measure	tran	tpsum26		trig	v(A11)	td=64.5n	val=vddval_2	cross=1	targ v(S16)	td=64.5n	val=vddval_2	cross=1
.measure	tran	tpsum27		trig	v(A11)	td=66.5n	val=vddval_2	cross=1	targ v(S16)	td=66.5n	val=vddval_2	cross=1


.measure tran tp param=291.9608p
.measure tran pdp param='tp*av_pow'


.op
.end