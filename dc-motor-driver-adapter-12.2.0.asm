
dc-motor-driver-adapter.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <jump_reset>:
   0:	2840006f          	j	284 <reset_handler>

00000004 <vectors>:
   4:	00000000 00000282 00000282 00000000     ................
	...
  30:	00000282 00000000 00000282 00000000     ................
  40:	00000282 00000282 00000282 00000282     ................
  50:	00000282 00000282 00000282 00000282     ................
  60:	00000282 00000282 00000282 00000282     ................
  70:	00000282 00000282 00000282 00000282     ................
  80:	00000282 00000282 00000282 00000282     ................
  90:	00000282 00000282 00000282              ............

Disassembly of section .text:

0000009c <main>:
  9c:	400117b7          	lui	a5,0x40011
  a0:	4398                	lw	a4,0(a5)
  a2:	fff106b7          	lui	a3,0xfff10
  a6:	16fd                	addi	a3,a3,-1 # fff0ffff <__global_pointer$+0xdff0f7ff>
  a8:	1151                	addi	sp,sp,-12
  aa:	8f75                	and	a4,a4,a3
  ac:	66c1                	lui	a3,0x10
  ae:	c406                	sw	ra,8(sp)
  b0:	c222                	sw	s0,4(sp)
  b2:	c026                	sw	s1,0(sp)
  b4:	8f55                	or	a4,a4,a3
  b6:	c398                	sw	a4,0(a5)
  b8:	80078613          	addi	a2,a5,-2048 # 40010800 <__global_pointer$+0x20010000>
  bc:	4218                	lw	a4,0(a2)
  be:	76fd                	lui	a3,0xfffff
  c0:	0ff68693          	addi	a3,a3,255 # fffff0ff <__global_pointer$+0xdfffe8ff>
  c4:	8f75                	and	a4,a4,a3
  c6:	10076713          	ori	a4,a4,256
  ca:	c218                	sw	a4,0(a2)
  cc:	40021637          	lui	a2,0x40021
  d0:	4e18                	lw	a4,24(a2)
  d2:	6691                	lui	a3,0x4
  d4:	02168693          	addi	a3,a3,33 # 4021 <uart_rx.c.1aba6b1a+0x2c7e>
  d8:	8f55                	or	a4,a4,a3
  da:	ce18                	sw	a4,24(a2)
  dc:	40078793          	addi	a5,a5,1024
  e0:	4398                	lw	a4,0(a5)
  e2:	f10006b7          	lui	a3,0xf1000
  e6:	16fd                	addi	a3,a3,-1 # f0ffffff <__global_pointer$+0xd0fff7ff>
  e8:	8f75                	and	a4,a4,a3
  ea:	080006b7          	lui	a3,0x8000
  ee:	8f55                	or	a4,a4,a3
  f0:	c398                	sw	a4,0(a5)
  f2:	40014637          	lui	a2,0x40014
  f6:	04000713          	li	a4,64
  fa:	cb98                	sw	a4,16(a5)
  fc:	80060613          	addi	a2,a2,-2048 # 40013800 <__global_pointer$+0x20013000>
 100:	09c00793          	li	a5,156
 104:	00f61423          	sh	a5,8(a2)
 108:	6789                	lui	a5,0x2
 10a:	0791                	addi	a5,a5,4 # 2004 <uart_rx.c.1aba6b1a+0xc61>
 10c:	00f61623          	sh	a5,12(a2)
 110:	8081c503          	lbu	a0,-2040(gp) # 20000008 <len.2>
 114:	200007b7          	lui	a5,0x20000
 118:	0047a403          	lw	s0,4(a5) # 20000004 <crsf_payload_pos.1>
 11c:	80c1a683          	lw	a3,-2036(gp) # 2000000c <crsf_state>
 120:	4305                	li	t1,1
 122:	4289                	li	t0,2
 124:	81018793          	addi	a5,gp,-2032 # 20000010 <crsf_payload.0>
 128:	200003b7          	lui	t2,0x20000
 12c:	4085                	li	ra,1
 12e:	00065703          	lhu	a4,0(a2)
 132:	02077713          	andi	a4,a4,32
 136:	df65                	beqz	a4,12e <main+0x92>
 138:	00465703          	lhu	a4,4(a2)
 13c:	0ff77713          	zext.b	a4,a4
 140:	00668f63          	beq	a3,t1,15e <main+0xc2>
 144:	02568663          	beq	a3,t0,170 <main+0xd4>
 148:	f2fd                	bnez	a3,12e <main+0x92>
 14a:	f3870713          	addi	a4,a4,-200
 14e:	00173693          	seqz	a3,a4
 152:	85a2                	mv	a1,s0
 154:	a821                	j	16c <main+0xd0>
 156:	85a2                	mv	a1,s0
 158:	853a                	mv	a0,a4
 15a:	4681                	li	a3,0
 15c:	a801                	j	16c <main+0xd0>
 15e:	02000693          	li	a3,32
 162:	fee6eae3          	bltu	a3,a4,156 <main+0xba>
 166:	853a                	mv	a0,a4
 168:	4581                	li	a1,0
 16a:	4689                	li	a3,2
 16c:	842e                	mv	s0,a1
 16e:	b7c1                	j	12e <main+0x92>
 170:	00140593          	addi	a1,s0,1
 174:	943e                	add	s0,s0,a5
 176:	00e40023          	sb	a4,0(s0)
 17a:	fea599e3          	bne	a1,a0,16c <main+0xd0>
 17e:	4761                	li	a4,24
 180:	fce51de3          	bne	a0,a4,15a <main+0xbe>
 184:	0007c403          	lbu	s0,0(a5)
 188:	4759                	li	a4,22
 18a:	4681                	li	a3,0
 18c:	fee410e3          	bne	s0,a4,16c <main+0xd0>
 190:	4398                	lw	a4,0(a5)
 192:	00875693          	srli	a3,a4,0x8
 196:	7ff6f693          	andi	a3,a3,2047
 19a:	d394                	sw	a3,32(a5)
 19c:	01e75413          	srli	s0,a4,0x1e
 1a0:	01375693          	srli	a3,a4,0x13
 1a4:	43d8                	lw	a4,4(a5)
 1a6:	7ff6f693          	andi	a3,a3,2047
 1aa:	d3d4                	sw	a3,36(a5)
 1ac:	1ff77693          	andi	a3,a4,511
 1b0:	068a                	slli	a3,a3,0x2
 1b2:	8ec1                	or	a3,a3,s0
 1b4:	d794                	sw	a3,40(a5)
 1b6:	00975693          	srli	a3,a4,0x9
 1ba:	7ff6f693          	andi	a3,a3,2047
 1be:	d7d4                	sw	a3,44(a5)
 1c0:	01475693          	srli	a3,a4,0x14
 1c4:	7ff6f693          	andi	a3,a3,2047
 1c8:	db94                	sw	a3,48(a5)
 1ca:	4794                	lw	a3,8(a5)
 1cc:	837d                	srli	a4,a4,0x1f
 1ce:	3ff6f413          	andi	s0,a3,1023
 1d2:	0406                	slli	s0,s0,0x1
 1d4:	8f41                	or	a4,a4,s0
 1d6:	dbd8                	sw	a4,52(a5)
 1d8:	00a6d713          	srli	a4,a3,0xa
 1dc:	7ff77713          	andi	a4,a4,2047
 1e0:	df98                	sw	a4,56(a5)
 1e2:	47d8                	lw	a4,12(a5)
 1e4:	82d5                	srli	a3,a3,0x15
 1e6:	dfd4                	sw	a3,60(a5)
 1e8:	7ff77693          	andi	a3,a4,2047
 1ec:	c3b4                	sw	a3,64(a5)
 1ee:	01675413          	srli	s0,a4,0x16
 1f2:	00b75693          	srli	a3,a4,0xb
 1f6:	4b98                	lw	a4,16(a5)
 1f8:	7ff6f693          	andi	a3,a3,2047
 1fc:	c3f4                	sw	a3,68(a5)
 1fe:	00177693          	andi	a3,a4,1
 202:	06aa                	slli	a3,a3,0xa
 204:	8ec1                	or	a3,a3,s0
 206:	c7b4                	sw	a3,72(a5)
 208:	00175693          	srli	a3,a4,0x1
 20c:	7ff6f693          	andi	a3,a3,2047
 210:	c7f4                	sw	a3,76(a5)
 212:	00c75693          	srli	a3,a4,0xc
 216:	7ff6f693          	andi	a3,a3,2047
 21a:	cbb4                	sw	a3,80(a5)
 21c:	01775693          	srli	a3,a4,0x17
 220:	4bd8                	lw	a4,20(a5)
 222:	00377413          	andi	s0,a4,3
 226:	0426                	slli	s0,s0,0x9
 228:	8ec1                	or	a3,a3,s0
 22a:	cbf4                	sw	a3,84(a5)
 22c:	00275693          	srli	a3,a4,0x2
 230:	7ff6f693          	andi	a3,a3,2047
 234:	8335                	srli	a4,a4,0xd
 236:	cfb4                	sw	a3,88(a5)
 238:	7ff77713          	andi	a4,a4,2047
 23c:	cff8                	sw	a4,92(a5)
 23e:	00138023          	sb	ra,0(t2) # 20000000 <crsf_frame_ready>
 242:	47e0                	lw	s0,76(a5)
 244:	1f300713          	li	a4,499
 248:	00874b63          	blt	a4,s0,25e <main+0x1c2>
 24c:	40011737          	lui	a4,0x40011
 250:	46c1                	li	a3,16
 252:	cb14                	sw	a3,16(a4)
 254:	80070713          	addi	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 258:	4691                	li	a3,4
 25a:	cb54                	sw	a3,20(a4)
 25c:	bdfd                	j	15a <main+0xbe>
 25e:	40011737          	lui	a4,0x40011
 262:	5dc00493          	li	s1,1500
 266:	80070693          	addi	a3,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 26a:	0084d763          	bge	s1,s0,278 <main+0x1dc>
 26e:	4441                	li	s0,16
 270:	cb40                	sw	s0,20(a4)
 272:	4711                	li	a4,4
 274:	ca98                	sw	a4,16(a3)
 276:	b5d5                	j	15a <main+0xbe>
 278:	4441                	li	s0,16
 27a:	cb40                	sw	s0,20(a4)
 27c:	4711                	li	a4,4
 27e:	cad8                	sw	a4,20(a3)
 280:	bde9                	j	15a <main+0xbe>

00000282 <ADC1_IRQHandler>:
 282:	a001                	j	282 <ADC1_IRQHandler>

00000284 <reset_handler>:
 284:	09c00793          	li	a5,156
 288:	20000197          	auipc	gp,0x20000
 28c:	57818193          	addi	gp,gp,1400 # 20000800 <__global_pointer$>
 290:	00018113          	mv	sp,gp
 294:	08800513          	li	a0,136
 298:	30051073          	.4byte	0x30051073
 29c:	458d                	li	a1,3
 29e:	80459073          	.4byte	0x80459073
 2a2:	00000517          	auipc	a0,0x0
 2a6:	d5e50513          	addi	a0,a0,-674 # 0 <jump_reset>
 2aa:	8d4d                	or	a0,a0,a1
 2ac:	30551073          	.4byte	0x30551073
 2b0:	34179073          	.4byte	0x34179073
 2b4:	200007b7          	lui	a5,0x20000
 2b8:	200006b7          	lui	a3,0x20000
 2bc:	30c00713          	li	a4,780
 2c0:	00078793          	mv	a5,a5
 2c4:	00068693          	mv	a3,a3
 2c8:	02d7e963          	bltu	a5,a3,2fa <main.c.2132563b+0x3f>
 2cc:	200007b7          	lui	a5,0x20000
 2d0:	00078793          	mv	a5,a5
 2d4:	87018713          	addi	a4,gp,-1936 # 20000070 <_ebss>
 2d8:	02e7e663          	bltu	a5,a4,304 <main.c.2132563b+0x49>
 2dc:	400217b7          	lui	a5,0x40021
 2e0:	07000713          	li	a4,112
 2e4:	c3d8                	sw	a4,4(a5)
 2e6:	4695                	li	a3,5
 2e8:	e000f737          	lui	a4,0xe000f
 2ec:	c314                	sw	a3,0(a4)
 2ee:	4f98                	lw	a4,24(a5)
 2f0:	03476713          	ori	a4,a4,52
 2f4:	cf98                	sw	a4,24(a5)
 2f6:	30200073          	mret
 2fa:	4310                	lw	a2,0(a4)
 2fc:	0711                	addi	a4,a4,4 # e000f004 <__global_pointer$+0xc000e804>
 2fe:	c390                	sw	a2,0(a5)
 300:	0791                	addi	a5,a5,4 # 40021004 <__global_pointer$+0x20020804>
 302:	b7d9                	j	2c8 <main.c.2132563b+0xd>
 304:	0007a023          	sw	zero,0(a5)
 308:	0791                	addi	a5,a5,4
 30a:	b7f9                	j	2d8 <main.c.2132563b+0x1d>
