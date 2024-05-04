IG_XOR_2_ST
******************************************************

.option abstol=1e-6 reltol=1e-6 post ingold dcon=1

.protect

.include '20IGfet.pm'

.include '20IGfetTG.pm'

.unprotect

******************************************************

Xp1		n_1		Abar	vh		vdd		pFinFET		num = 1

Xp2		n_1		Bbar	vh		vdd		pFinFET		num = 1

Xp3		out		A		vh		n_1		pFinFET		num = 1

Xp4		out		B		vh		n_1		pFinFET		num = 1

Xn1		out		Abar	vl		n_2	    nFinFET		num = 1
									    
Xn2		out		B		vl		n_2	    nFinFET		num = 1
									    
Xn3		n_2		A		vl		gnd	    nFinFET		num = 1
									    
Xn4		n_2		Bbar	vl		gnd	    nFinFET		num = 1


******************************************************

.param vddval=0.9

.param vddval_2='vddval/2'

.param	t=10p

.param	vhi=1.1

.param	vlow=-0.2

******************************************************

vdd vdd 0 vddval

vh	vh	0	vhi

vl	vl	0	vlow

*******************************************************************

*VA		A		0	dc	0
*
*VAbar	Abar	0	dc	vddval
*
*VB		B		0	dc	0
*
*VBbar	Bbar	0	dc	vddval

***************(A=0) & (B=1)***************************************

*VA		A		0	dc	0
*
*VAbar	Abar	0	dc	vddval
*
*VB		B		0	dc	vddval
*
*VBbar	Bbar	0	dc	0

****************(A=1) & (B=0)***************************************

*VA		A		0	dc	vddval
*
*VAbar	Abar	0	dc	0
*
*VB		B		0	dc	0
*
*VBbar	Bbar	0	dc	vddval

****************(A=1) & (B=1)***************************************

VA		A		0	dc	vddval

VAbar	Abar	0	dc	0

VB		B		0	dc	vddval

VBbar	Bbar	0	dc	0

Cl	out	0	1f

.tran 1p 17n


.MEASURE TRAN pow_vdd	 	AVG P(vdd)	 	FROM=0 TO=17n

.MEASURE TRAN pow_va		AVG P(va)	 	FROM=0 TO=17n

.MEASURE TRAN pow_vabar		AVG P(vabar) 	FROM=0 TO=17n

.MEASURE TRAN pow_b			AVG P(vb)		FROM=0 TO=17n

.MEASURE TRAN pow_bbar		AVG P(vbbar)	FROM=0 TO=17n

.MEASURE TRAN pow_vhi		AVG P(vh)		FROM=0 TO=17n

.MEASURE TRAN pow_vlow		AVG P(vl)		FROM=0 TO=17n

.measure tran avg_sum param='pow_vdd+pow_va+pow_vabar+pow_b+pow_bbar'



.op
.end