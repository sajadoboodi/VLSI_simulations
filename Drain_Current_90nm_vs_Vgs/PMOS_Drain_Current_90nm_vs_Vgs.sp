PMOS_Drain_Current_90nm
***********
.protect
.lib 'mm90.l' TT
.unprotect
.param vddval=1.2
.param p_vddval="-vddval"
***********
.option post=2

Mp d g vdd vdd pmos l=100n w=300n

vgs g gnd vddval

vds d gnd p_vddval

vdd vdd gnd 0

.dc vgs p_vddval 0 0.01
.probe -I(mp)
.op
.end