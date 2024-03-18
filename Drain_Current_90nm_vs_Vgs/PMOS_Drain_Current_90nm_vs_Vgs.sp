PMOS_Drain_Current_90nm
***********
.protect
.lib 'mm90.l' TT
.unprotect
.param vddval=1.2
***********
.option post=2

Mp gnd g vdd vdd pmos l=100n w=300n

vdd vdd 0 vddval

vgs g vdd 0

*vds d gnd vddval

.dc vgs 0 -1.2 0.01

.probe -I(mp)
.op
.end