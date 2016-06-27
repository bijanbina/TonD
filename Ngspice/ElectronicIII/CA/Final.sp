OTA

.model nch NMOS(level=1   vto=0.7 gamma=0.45 phi=0.9 nsub=9e+14
+  ld=0.08e-6 uo=350 lambda=0.1 tox=9e-9 pb=0.9 cj=0.56e-3 cjsw=0.35e-11 mj=0.45 
+  mjsw=0.2  cgdo=0.4e-9 js=1e-8)

.model pch PMOS(level=1   vto=-0.8 gamma=0.4 phi=0.8 nsub=5e+14
+  ld=0.09e-6 uo=100 lambda=0.2 tox=9e-9 pb=0.9 cj=0.94e-3 cjsw=0.32e-11 mj=0.5 
+  mjsw=0.3  cgdo=0.3e-9 js=0.5e-8)

.PARAM  t=2
Vs	Vdd	gnd	DC	3
Vin1	vinn	gnd	DC	1.5
Vin2	vinp	gnd	DC	1.5	SIN	(1.5	0.1m	1K)	AC	1
Ib      Vdd     G7      0.15m

*       DRAIN   GATE    SOURCE  BULK
M1	G3	vinn	tail	tail	pch	L=0.5U	W=538.44U
M2	G9	vinp	tail	tail	pch	L=0.5U	W=538.44U
M3	G3	G3	gnd	gnd	nch	L=0.5U	W=7.445U
M4	G9	G3	gnd	gnd	nch	L=0.5U	W=7.445U
M5	tail	G10	Vdd	Vdd	pch	L=0.5U	W=44.17U
M6	G8	G10	Vdd	Vdd	pch	L=0.5U	W=44.17U
M7	G8	G9	gnd	gnd	nch	L=0.5U	W=16U
M8	Vdd	G8	Vout	Vout	nch	L=0.5U	W=40.19U
M9	Vout	G9	gnd	gnd	nch	L=0.5U	W=16U
M10	G10	G10	Vdd	Vdd	pch	L=0.5U	W=44.17U
M11	G14	G10	Vdd	Vdd	nch	L=0.5U	W=44.17U
M12	G14	G14	G13	G13	nch	L=0.5U	W=16U
M13	G13	G13	gnd	gnd	nch	L=0.5U	W=16U
M14	G10	G14	S14	S14	nch	L=0.5U	W=16U
M15	S14	G13	S15	S15	nch	L=0.5U	W=4U
M16	D16	G14	G9	G9	nch	L=0.5U	W=4.795U

Rb	gnd	S15	998.72
Cc	G8	D16     585f

*Vbias	G10	gnd	1.7M
*Ibias	G10	gnd	250u


.control
	OP
	*LISTING //print all codes
	print	I(Vs)
	print @m1[gm]
	print @m2[gm]
	print @m7[gm]
	set hcopypscolor=1
	TRAN	10u	3m	0m
	plot	V(Vout)
	plot	V(vinp)
	plot	V(vinn)
	plot	Mag(V(G8))/Mag(V(G9))
	plot	Mag(V(G9))
	plot	V(G8)
	plot	V(Vout)
	*FOURIER	1K	Vout
	AC	DEC	100	100k	100G
	plot	Vdb(Vout)
	plot	phase(Vout) * 180 / PI
.endc

.end
