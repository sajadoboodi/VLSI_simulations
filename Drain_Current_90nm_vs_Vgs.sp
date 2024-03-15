Drain_Current_90nm
***********
.protect
.lib 'mm90.l' TT
.unprotect
.param vddval=1.2
***********
.option post=2

Mn d g gnd gnd nmos l=100n w=120n

vgs g gnd vddval

vds d gnd vddval

.dc vgs 0 vddval 0.01
.probe I(mn)
.op
.end