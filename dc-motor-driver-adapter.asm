
dc-motor-driver-adapter.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <jump_reset>:
   0:	28e0006f          	j	28e <reset_handler>

00000004 <vectors>:
   4:	00000000 0000028c 0000028c 00000000     ................
	...
  30:	0000028c 00000000 0000028c 00000000     ................
  40:	0000028c 0000028c 0000028c 0000028c     ................
  50:	0000028c 0000028c 0000028c 0000028c     ................
  60:	0000028c 0000028c 0000028c 0000028c     ................
  70:	0000028c 0000028c 0000028c 0000028c     ................
  80:	0000028c 0000028c 0000028c 0000028c     ................
  90:	0000028c 0000028c 0000028c              ............

Disassembly of section .text:

0000009c <main>:
  9c:	400116b7          	lui	a3,0x40011
  a0:	429c                	lw	a5,0(a3)
  a2:	fff10737          	lui	a4,0xfff10
  a6:	177d                	add	a4,a4,-1 # fff0ffff <__global_pointer$+0xdff0f7ff>
  a8:	1151                	add	sp,sp,-12
  aa:	8ff9                	and	a5,a5,a4
  ac:	6741                	lui	a4,0x10
  ae:	c406                	sw	ra,8(sp)
  b0:	c222                	sw	s0,4(sp)
  b2:	c026                	sw	s1,0(sp)
  b4:	8fd9                	or	a5,a5,a4
  b6:	40011737          	lui	a4,0x40011
  ba:	c29c                	sw	a5,0(a3)
  bc:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
  c0:	431c                	lw	a5,0(a4)
  c2:	76fd                	lui	a3,0xfffff
  c4:	0ff68693          	add	a3,a3,255 # fffff0ff <__global_pointer$+0xdfffe8ff>
  c8:	8ff5                	and	a5,a5,a3
  ca:	1007e793          	or	a5,a5,256
  ce:	c31c                	sw	a5,0(a4)
  d0:	400216b7          	lui	a3,0x40021
  d4:	4e9c                	lw	a5,24(a3)
  d6:	6711                	lui	a4,0x4
  d8:	02170713          	add	a4,a4,33 # 4021 <uart_rx.c.26d07654+0x3270>
  dc:	8fd9                	or	a5,a5,a4
  de:	ce9c                	sw	a5,24(a3)
  e0:	400117b7          	lui	a5,0x40011
  e4:	40078793          	add	a5,a5,1024 # 40011400 <__global_pointer$+0x20010c00>
  e8:	4398                	lw	a4,0(a5)
  ea:	f10006b7          	lui	a3,0xf1000
  ee:	16fd                	add	a3,a3,-1 # f0ffffff <__global_pointer$+0xd0fff7ff>
  f0:	8f75                	and	a4,a4,a3
  f2:	080006b7          	lui	a3,0x8000
  f6:	8f55                	or	a4,a4,a3
  f8:	c398                	sw	a4,0(a5)
  fa:	400145b7          	lui	a1,0x40014
  fe:	04000713          	li	a4,64
 102:	cb98                	sw	a4,16(a5)
 104:	80058593          	add	a1,a1,-2048 # 40013800 <__global_pointer$+0x20013000>
 108:	09c00793          	li	a5,156
 10c:	00f59423          	sh	a5,8(a1)
 110:	6789                	lui	a5,0x2
 112:	0791                	add	a5,a5,4 # 2004 <uart_rx.c.26d07654+0x1253>
 114:	00f59623          	sh	a5,12(a1)
 118:	8081c503          	lbu	a0,-2040(gp) # 20000008 <len.2>
 11c:	200007b7          	lui	a5,0x20000
 120:	0047a603          	lw	a2,4(a5) # 20000004 <crsf_payload_pos.1>
 124:	80c1a683          	lw	a3,-2036(gp) # 2000000c <crsf_state>
 128:	4285                	li	t0,1
 12a:	02000393          	li	t2,32
 12e:	81018793          	add	a5,gp,-2032 # 20000010 <crsf_payload.0>
 132:	200000b7          	lui	ra,0x20000
 136:	4405                	li	s0,1
 138:	0005d703          	lhu	a4,0(a1)
 13c:	02077713          	and	a4,a4,32
 140:	df65                	beqz	a4,138 <main+0x9c>
 142:	0045d703          	lhu	a4,4(a1)
 146:	0ff77713          	zext.b	a4,a4
 14a:	00568e63          	beq	a3,t0,166 <main+0xca>
 14e:	4309                	li	t1,2
 150:	02668163          	beq	a3,t1,172 <main+0xd6>
 154:	f2f5                	bnez	a3,138 <main+0x9c>
 156:	f3870713          	add	a4,a4,-200
 15a:	00173693          	seqz	a3,a4
 15e:	bfe9                	j	138 <main+0x9c>
 160:	853a                	mv	a0,a4
 162:	4681                	li	a3,0
 164:	bfd1                	j	138 <main+0x9c>
 166:	fee3ede3          	bltu	t2,a4,160 <main+0xc4>
 16a:	853a                	mv	a0,a4
 16c:	4601                	li	a2,0
 16e:	4689                	li	a3,2
 170:	b7e1                	j	138 <main+0x9c>
 172:	00160313          	add	t1,a2,1
 176:	963e                	add	a2,a2,a5
 178:	00e60023          	sb	a4,0(a2)
 17c:	861a                	mv	a2,t1
 17e:	faa31de3          	bne	t1,a0,138 <main+0x9c>
 182:	4761                	li	a4,24
 184:	0ee51d63          	bne	a0,a4,27e <main.c.4c27767a+0xb9>
 188:	0007c483          	lbu	s1,0(a5)
 18c:	4759                	li	a4,22
 18e:	4681                	li	a3,0
 190:	fae494e3          	bne	s1,a4,138 <main+0x9c>
 194:	4398                	lw	a4,0(a5)
 196:	00875693          	srl	a3,a4,0x8
 19a:	7ff6f693          	and	a3,a3,2047
 19e:	d394                	sw	a3,32(a5)
 1a0:	01e75613          	srl	a2,a4,0x1e
 1a4:	01375693          	srl	a3,a4,0x13
 1a8:	43d8                	lw	a4,4(a5)
 1aa:	7ff6f693          	and	a3,a3,2047
 1ae:	d3d4                	sw	a3,36(a5)
 1b0:	1ff77693          	and	a3,a4,511
 1b4:	068a                	sll	a3,a3,0x2
 1b6:	8ed1                	or	a3,a3,a2
 1b8:	d794                	sw	a3,40(a5)
 1ba:	00975693          	srl	a3,a4,0x9
 1be:	7ff6f693          	and	a3,a3,2047
 1c2:	d7d4                	sw	a3,44(a5)
 1c4:	01475693          	srl	a3,a4,0x14
 1c8:	7ff6f693          	and	a3,a3,2047
 1cc:	db94                	sw	a3,48(a5)
 1ce:	4794                	lw	a3,8(a5)
 1d0:	837d                	srl	a4,a4,0x1f
 1d2:	3ff6f613          	and	a2,a3,1023
 1d6:	0606                	sll	a2,a2,0x1
 1d8:	8f51                	or	a4,a4,a2
 1da:	dbd8                	sw	a4,52(a5)
 1dc:	00a6d713          	srl	a4,a3,0xa
 1e0:	7ff77713          	and	a4,a4,2047
 1e4:	df98                	sw	a4,56(a5)
 1e6:	47d8                	lw	a4,12(a5)
 1e8:	82d5                	srl	a3,a3,0x15
 1ea:	dfd4                	sw	a3,60(a5)
 1ec:	7ff77693          	and	a3,a4,2047
 1f0:	c3b4                	sw	a3,64(a5)
 1f2:	01675613          	srl	a2,a4,0x16
 1f6:	00b75693          	srl	a3,a4,0xb
 1fa:	4b98                	lw	a4,16(a5)
 1fc:	7ff6f693          	and	a3,a3,2047
 200:	c3f4                	sw	a3,68(a5)
 202:	00177693          	and	a3,a4,1
 206:	06aa                	sll	a3,a3,0xa
 208:	8ed1                	or	a3,a3,a2
 20a:	c7b4                	sw	a3,72(a5)
 20c:	00175693          	srl	a3,a4,0x1
 210:	7ff6f693          	and	a3,a3,2047
 214:	c7f4                	sw	a3,76(a5)
 216:	00c75693          	srl	a3,a4,0xc
 21a:	7ff6f693          	and	a3,a3,2047
 21e:	cbb4                	sw	a3,80(a5)
 220:	01775693          	srl	a3,a4,0x17
 224:	4bd8                	lw	a4,20(a5)
 226:	00377613          	and	a2,a4,3
 22a:	0626                	sll	a2,a2,0x9
 22c:	8ed1                	or	a3,a3,a2
 22e:	cbf4                	sw	a3,84(a5)
 230:	00275693          	srl	a3,a4,0x2
 234:	7ff6f693          	and	a3,a3,2047
 238:	8335                	srl	a4,a4,0xd
 23a:	cfb4                	sw	a3,88(a5)
 23c:	7ff77713          	and	a4,a4,2047
 240:	cff8                	sw	a4,92(a5)
 242:	00808023          	sb	s0,0(ra) # 20000000 <crsf_frame_ready>
 246:	47f4                	lw	a3,76(a5)
 248:	1f300713          	li	a4,499
 24c:	00d74b63          	blt	a4,a3,262 <main.c.4c27767a+0x9d>
 250:	40011737          	lui	a4,0x40011
 254:	46c1                	li	a3,16
 256:	cb14                	sw	a3,16(a4)
 258:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 25c:	4691                	li	a3,4
 25e:	cb54                	sw	a3,20(a4)
 260:	a839                	j	27e <main.c.4c27767a+0xb9>
 262:	40011737          	lui	a4,0x40011
 266:	5dc00613          	li	a2,1500
 26a:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 26e:	00d65a63          	bge	a2,a3,282 <main.c.4c27767a+0xbd>
 272:	400116b7          	lui	a3,0x40011
 276:	4641                	li	a2,16
 278:	cad0                	sw	a2,20(a3)
 27a:	4691                	li	a3,4
 27c:	cb14                	sw	a3,16(a4)
 27e:	861a                	mv	a2,t1
 280:	b5cd                	j	162 <main+0xc6>
 282:	400116b7          	lui	a3,0x40011
 286:	4641                	li	a2,16
 288:	cad0                	sw	a2,20(a3)
 28a:	bfc9                	j	25c <main.c.4c27767a+0x97>

0000028c <ADC1_IRQHandler>:
 28c:	a001                	j	28c <ADC1_IRQHandler>

0000028e <reset_handler>:
 28e:	09c00793          	li	a5,156
 292:	20000197          	auipc	gp,0x20000
 296:	56e18193          	add	gp,gp,1390 # 20000800 <__global_pointer$>
 29a:	00018113          	mv	sp,gp
 29e:	08800513          	li	a0,136
 2a2:	30051073          	csrw	mstatus,a0
 2a6:	458d                	li	a1,3
 2a8:	80459073          	csrw	0x804,a1
 2ac:	00000517          	auipc	a0,0x0
 2b0:	d5450513          	add	a0,a0,-684 # 0 <jump_reset>
 2b4:	8d4d                	or	a0,a0,a1
 2b6:	30551073          	csrw	mtvec,a0
 2ba:	34179073          	csrw	mepc,a5
 2be:	200007b7          	lui	a5,0x20000
 2c2:	200006b7          	lui	a3,0x20000
 2c6:	31800713          	li	a4,792
 2ca:	00078793          	mv	a5,a5
 2ce:	00068693          	mv	a3,a3
 2d2:	02d7e963          	bltu	a5,a3,304 <reset_handler+0x76>
 2d6:	200007b7          	lui	a5,0x20000
 2da:	00078793          	mv	a5,a5
 2de:	87018713          	add	a4,gp,-1936 # 20000070 <_ebss>
 2e2:	02e7e663          	bltu	a5,a4,30e <reset_handler+0x80>
 2e6:	400217b7          	lui	a5,0x40021
 2ea:	07000713          	li	a4,112
 2ee:	c3d8                	sw	a4,4(a5)
 2f0:	4695                	li	a3,5
 2f2:	e000f737          	lui	a4,0xe000f
 2f6:	c314                	sw	a3,0(a4)
 2f8:	4f98                	lw	a4,24(a5)
 2fa:	03476713          	or	a4,a4,52
 2fe:	cf98                	sw	a4,24(a5)
 300:	30200073          	mret
 304:	4310                	lw	a2,0(a4)
 306:	0711                	add	a4,a4,4 # e000f004 <__global_pointer$+0xc000e804>
 308:	c390                	sw	a2,0(a5)
 30a:	0791                	add	a5,a5,4 # 40021004 <__global_pointer$+0x20020804>
 30c:	b7d9                	j	2d2 <reset_handler+0x44>
 30e:	0007a023          	sw	zero,0(a5)
 312:	0791                	add	a5,a5,4
 314:	b7f9                	j	2e2 <reset_handler+0x54>
	...
