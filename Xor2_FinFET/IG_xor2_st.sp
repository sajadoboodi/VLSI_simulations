IG_XOR_2_ST
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

***************(A=0) & (B=0)***************************************

*
*VA		A		0	dc	0
*
*VAbar	Abar	0	dc	vddval
*
*VB		B		0	dc	0
*
*VBbar	Bbar	0	dc	vddval
*
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

.tran 1p 100n




.MEASURE TRAN pow_vdd	 	AVG P(vdd)	 	FROM=0 TO=100n

.MEASURE TRAN pow_va		AVG P(VA)	 	FROM=0 TO=100n

.MEASURE TRAN pow_vabar		AVG P(VAbar) 	FROM=0 TO=100n

.MEASURE TRAN pow_b			AVG P(VB)		FROM=0 TO=100n

.MEASURE TRAN pow_bbar		AVG P(VBbar)	FROM=0 TO=100n

.measure tran avg_sum param='pow_vdd+pow_va+pow_vabar+pow_b+pow_bbar'
*.measure tran st_power AVG POWER FROM=0n TO=100n

.end