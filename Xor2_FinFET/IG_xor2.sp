IG_XOR_2
******************************************************

.option abstol=1e-6 reltol=1e-6 post ingold dcon=1

.protect

.include '20IGfet.pm'

.include '20IGfetTG.pm'

.unprotect

******************************************************

Xp1		n_1		Abar	Bbar	vdd		pFinFET		num = 1

Xp2		out		A		B		n_1		pFinFET		num = 1

Xn1		out		Abar	B		n_2	    nFinFET		num = 1

Xn2		n_2		A		Bbar	gnd	    nFinFET		num = 1

******************************************************

.param vddval=0.9

.param vddval_2='vddval/2'

.param	t=10p

******************************************************

vdd vdd 0 vddval

va A 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n vddval, '3n-t' vddval, 3n vddval, '4n-t' vddval, 4n 0, '5n-t' 0, 5n 0, 
+ '6n-t' 0, 6n vddval  , '7n-t' vddval  , 7n vddval, '8n-t' vddval, 8n 0  , '9n-t' 0 , 9n vddval, '10n-t' vddval,
+ 10n vddval, '11n-t' vddval  , 11n 0,'12n-t' 0,12n 0,'13n-t' 0,13n 0,'14n-t' 0,14n vddval,'15n-t' vddval,15n vddval,
+'16n-t' vddval,16n 0)r


vabar Abar 0 PWL(0n vddval, '1n-t' vddval, 1n vddval, '2n-t' vddval, 2n 0, '3n-t' 0, 3n 0, '4n-t' 0, 4n vddval,
+'5n-t' vddval, 5n vddval, '6n-t' vddval, 6n 0  , '7n-t' 0  , 7n 0, '8n-t' 0, 8n vddval  , '9n-t' vddval , 9n 0,
+'10n-t' 0, 10n 0, '11n-t' 0  , 11n vddval,'12n-t' vddval,12n vddval,'13n-t' vddval,13n vddval,'14n-t' vddval,
+ 14n 0,'15n-t' 0,15n 0,'16n-t' 0,16n vddval)r



vb B 0 PWL(0n 0, '1n-t' 0, 1n 0, '2n-t' 0, 2n 0, '3n-t' 0, 3n 0, '4n-t' 0, 4n vddval, '5n-t' vddval, 5n vddval, 
+ '6n-t' vddval, 6n 0  , '7n-t' 0  , 7n vddval, '8n-t' vddval, 8n vddval  , '9n-t' vddval , 9n vddval, '10n-t' vddval, 10n vddval,  
+ '11n-t' vddval  , 11n 0,'12n-t' 0, 12n vddval,'13n-t' vddval,13n 0,'14n-t' 0,14n vddval,'15n-t' vddval,15n 0,'16n-t' 0,16n 0)r


vbbar Bbar 0 PWL(0n vddval, '1n-t' vddval, 1n vddval, '2n-t' vddval, 2n vddval, '3n-t' vddval, 3n vddval, '4n-t' vddval, 4n 0, '5n-t' 0, 5n 0, 
+ '6n-t' 0, 6n vddval  , '7n-t' vddval  , 7n 0, '8n-t' 0, 8n 0  , '9n-t' 0 , 9n 0, '10n-t' 0, 10n 0,  
+ '11n-t' 0  , 11n vddval,'12n-t' vddval, 12n 0,'13n-t' 0,13n vddval,'14n-t' vddval,14n 0,'15n-t' 0,15n vddval,'16n-t' vddval,16n vddval)r

Cl	out	0	1f

.tran 1p 17n

.measure tran tpout1 trig v(A) td=1.8n val=vddval_2 cross=1 targ v(out) td=1.8n val=vddval_2 cross=1

.measure tran tpout2 trig v(‌B) td=6.5n val=vddval_2 cross=1 targ v(out) td=6.5n val=vddval_2 cross=1

.measure tran tpout3 trig v(‌A) td=7.5n val=vddval_2 cross=1 targ v(out) td=7.5n val=vddval_2 cross=1

.measure tran tpout4 trig v(‌A) td=8.5n val=vddval_2 cross=1 targ v(out) td=8.5n val=vddval_2 cross=1

.measure tran tpout5 trig v(‌B) td=11.5n val=vddval_2 cross=1 targ v(out) td=11.5n val=vddval_2 cross=1

.measure tran tpout6 trig v(‌B) td=12.5n val=vddval_2 cross=1 targ v(out) td=12.5n val=vddval_2 cross=1

.measure tran tpout7 trig v(‌B) td=14.5n val=vddval_2 cross=1 targ v(out) td=14.5n val=vddval_2 cross=1

.measure tran tpout8 trig v(‌A) td=15.5n val=vddval_2 cross=1 targ v(out) td=15.5n val=vddval_2 cross=1

.MEASURE TRAN pow_vdd	 	AVG P(vdd)	 	FROM=0 TO=17n

.MEASURE TRAN pow_va		AVG P(va)	 	FROM=0 TO=17n

.MEASURE TRAN pow_vabar		AVG P(vabar) 	FROM=0 TO=17n

.MEASURE TRAN pow_b			AVG P(vb)		FROM=0 TO=17n

.MEASURE TRAN pow_bbar		AVG P(vbbar)	FROM=0 TO=17n

.measure tran avg_sum param='pow_vdd+pow_va+pow_vabar+pow_b+pow_bbar'

.measure tran pdp param='2.7570e-11*avg_sum'

.op
.end