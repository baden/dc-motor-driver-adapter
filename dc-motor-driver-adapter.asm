
dc-motor-driver-adapter.elf:     file format elf32-littleriscv


Disassembly of section .init:

00000000 <jump_reset>:
   0:	3e60006f          	j	3e6 <reset_handler>

00000004 <vectors>:
   4:	00000000 000003e4 000003e4 00000000     ................
	...
  30:	000003e4 00000000 000003e4 00000000     ................
  40:	000003e4 000003e4 000003e4 000003e4     ................
  50:	000003e4 000003e4 000003e4 000003e4     ................
  60:	000003e4 000003e4 000003e4 000003e4     ................
  70:	000003e4 000003e4 000003e4 000003e4     ................
  80:	000003e4 000003e4 000003e4 000003e4     ................
  90:	000003e4 000003e4 000003e4              ............

Disassembly of section .text:

0000009c <SYS_init>:
  9c:	400217b7          	lui	a5,0x40021
  a0:	07000713          	li	a4,112
  a4:	c3d8                	sw	a4,4(a5)
  a6:	4695                	li	a3,5
  a8:	e000f737          	lui	a4,0xe000f
  ac:	c314                	sw	a3,0(a4)
  ae:	4f98                	lw	a4,24(a5)
  b0:	03476713          	or	a4,a4,52
  b4:	cf98                	sw	a4,24(a5)
  b6:	8082                	ret

000000b8 <main>:
  b8:	1151                	add	sp,sp,-12
  ba:	c222                	sw	s0,4(sp)
  bc:	40011437          	lui	s0,0x40011
  c0:	401c                	lw	a5,0(s0)
  c2:	fff10737          	lui	a4,0xfff10
  c6:	177d                	add	a4,a4,-1 # fff0ffff <__global_pointer$+0xdff0f7ff>
  c8:	8ff9                	and	a5,a5,a4
  ca:	6741                	lui	a4,0x10
  cc:	c406                	sw	ra,8(sp)
  ce:	c026                	sw	s1,0(sp)
  d0:	8fd9                	or	a5,a5,a4
  d2:	40011737          	lui	a4,0x40011
  d6:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
  da:	c01c                	sw	a5,0(s0)
  dc:	431c                	lw	a5,0(a4)
  de:	76fd                	lui	a3,0xfffff
  e0:	0ff68693          	add	a3,a3,255 # fffff0ff <__global_pointer$+0xdfffe8ff>
  e4:	8ff5                	and	a5,a5,a3
  e6:	1007e793          	or	a5,a5,256
  ea:	c31c                	sw	a5,0(a4)
  ec:	3f45                	jal	9c <SYS_init>
  ee:	400217b7          	lui	a5,0x40021
  f2:	4f98                	lw	a4,24(a5)
  f4:	6691                	lui	a3,0x4
  f6:	02168693          	add	a3,a3,33 # 4021 <uart_rx.c.26d07654+0x2c7d>
  fa:	8f55                	or	a4,a4,a3
  fc:	cf98                	sw	a4,24(a5)
  fe:	40011737          	lui	a4,0x40011
 102:	40070713          	add	a4,a4,1024 # 40011400 <__global_pointer$+0x20010c00>
 106:	4314                	lw	a3,0(a4)
 108:	f1000637          	lui	a2,0xf1000
 10c:	167d                	add	a2,a2,-1 # f0ffffff <__global_pointer$+0xd0fff7ff>
 10e:	8ef1                	and	a3,a3,a2
 110:	08000637          	lui	a2,0x8000
 114:	8ed1                	or	a3,a3,a2
 116:	c314                	sw	a3,0(a4)
 118:	04000693          	li	a3,64
 11c:	cb14                	sw	a3,16(a4)
 11e:	40014737          	lui	a4,0x40014
 122:	09c00693          	li	a3,156
 126:	80d71423          	sh	a3,-2040(a4) # 40013808 <__global_pointer$+0x20013008>
 12a:	6689                	lui	a3,0x2
 12c:	0691                	add	a3,a3,4 # 2004 <uart_rx.c.26d07654+0xc60>
 12e:	80d71623          	sh	a3,-2036(a4)
 132:	4f98                	lw	a4,24(a5)
 134:	002006b7          	lui	a3,0x200
 138:	01176713          	or	a4,a4,17
 13c:	cf98                	sw	a4,24(a5)
 13e:	4fd8                	lw	a4,28(a5)
 140:	8f55                	or	a4,a4,a3
 142:	cfd8                	sw	a4,28(a5)
 144:	401c                	lw	a5,0(s0)
 146:	777d                	lui	a4,0xfffff
 148:	073d                	add	a4,a4,15 # fffff00f <__global_pointer$+0xdfffe80f>
 14a:	8ff9                	and	a5,a5,a4
 14c:	6705                	lui	a4,0x1
 14e:	dd070713          	add	a4,a4,-560 # dd0 <system.c.06ca16bb+0x17e>
 152:	8fd9                	or	a5,a5,a4
 154:	c01c                	sw	a5,0(s0)
 156:	400057b7          	lui	a5,0x40005
 15a:	40078793          	add	a5,a5,1024 # 40005400 <__global_pointer$+0x20004c00>
 15e:	4711                	li	a4,4
 160:	00e79223          	sh	a4,4(a5)
 164:	7761                	lui	a4,0xffff8
 166:	0729                	add	a4,a4,10 # ffff800a <__global_pointer$+0xdfff780a>
 168:	00e79e23          	sh	a4,28(a5)
 16c:	4705                	li	a4,1
 16e:	00e79023          	sh	a4,0(a5)
 172:	0187d703          	lhu	a4,24(a5)
 176:	8b09                	and	a4,a4,2
 178:	ff6d                	bnez	a4,172 <main+0xba>
 17a:	0007d703          	lhu	a4,0(a5)
 17e:	10076713          	or	a4,a4,256
 182:	00e79023          	sh	a4,0(a5)
 186:	400057b7          	lui	a5,0x40005
 18a:	40078793          	add	a5,a5,1024 # 40005400 <__global_pointer$+0x20004c00>
 18e:	0147d703          	lhu	a4,20(a5)
 192:	8b05                	and	a4,a4,1
 194:	df6d                	beqz	a4,18e <main+0xd6>
 196:	0c000713          	li	a4,192
 19a:	00e79823          	sh	a4,16(a5)
 19e:	400056b7          	lui	a3,0x40005
 1a2:	00820737          	lui	a4,0x820
 1a6:	40068693          	add	a3,a3,1024 # 40005400 <__global_pointer$+0x20004c00>
 1aa:	070d                	add	a4,a4,3 # 820003 <uart_rx.c.26d07654+0x81ec5f>
 1ac:	0146d783          	lhu	a5,20(a3)
 1b0:	0186d603          	lhu	a2,24(a3)
 1b4:	07c2                	sll	a5,a5,0x10
 1b6:	8fd1                	or	a5,a5,a2
 1b8:	8ff9                	and	a5,a5,a4
 1ba:	fee799e3          	bne	a5,a4,1ac <main+0xf4>
 1be:	400057b7          	lui	a5,0x40005
 1c2:	40078793          	add	a5,a5,1024 # 40005400 <__global_pointer$+0x20004c00>
 1c6:	0147d703          	lhu	a4,20(a5)
 1ca:	08077713          	and	a4,a4,128
 1ce:	df65                	beqz	a4,1c6 <main+0x10e>
 1d0:	00079823          	sh	zero,16(a5)
 1d4:	400057b7          	lui	a5,0x40005
 1d8:	40078793          	add	a5,a5,1024 # 40005400 <__global_pointer$+0x20004c00>
 1dc:	0147d703          	lhu	a4,20(a5)
 1e0:	08077713          	and	a4,a4,128
 1e4:	df65                	beqz	a4,1dc <main+0x124>
 1e6:	00079823          	sh	zero,16(a5)
 1ea:	400057b7          	lui	a5,0x40005
 1ee:	40078793          	add	a5,a5,1024 # 40005400 <__global_pointer$+0x20004c00>
 1f2:	0147d703          	lhu	a4,20(a5)
 1f6:	8b11                	and	a4,a4,4
 1f8:	df6d                	beqz	a4,1f2 <main+0x13a>
 1fa:	0007d703          	lhu	a4,0(a5)
 1fe:	20076713          	or	a4,a4,512
 202:	00e79023          	sh	a4,0(a5)
 206:	e000f7b7          	lui	a5,0xe000f
 20a:	4794                	lw	a3,8(a5)
 20c:	002dc7b7          	lui	a5,0x2dc
 210:	6c078793          	add	a5,a5,1728 # 2dc6c0 <uart_rx.c.26d07654+0x2db31c>
 214:	96be                	add	a3,a3,a5
 216:	81018793          	add	a5,gp,-2032 # 20000010 <crsf_payload.0>
 21a:	200000b7          	lui	ra,0x20000
 21e:	400145b7          	lui	a1,0x40014
 222:	80058593          	add	a1,a1,-2048 # 40013800 <__global_pointer$+0x20013000>
 226:	e000f4b7          	lui	s1,0xe000f
 22a:	0005d703          	lhu	a4,0(a1)
 22e:	02077713          	and	a4,a4,32
 232:	18070363          	beqz	a4,3b8 <main.c.f1b9d4c6+0x141>
 236:	0045d703          	lhu	a4,4(a1)
 23a:	8081a503          	lw	a0,-2040(gp) # 20000008 <crsf_state>
 23e:	4285                	li	t0,1
 240:	0ff77713          	zext.b	a4,a4
 244:	04550063          	beq	a0,t0,284 <main.c.f1b9d4c6+0xd>
 248:	4409                	li	s0,2
 24a:	04850e63          	beq	a0,s0,2a6 <main.c.f1b9d4c6+0x2f>
 24e:	e519                	bnez	a0,25c <main+0x1a4>
 250:	0c800513          	li	a0,200
 254:	00a71463          	bne	a4,a0,25c <main+0x1a4>
 258:	8051a423          	sw	t0,-2040(gp) # 20000008 <crsf_state>
 25c:	80c1c703          	lbu	a4,-2036(gp) # 2000000c <crsf_frame_ready>
 260:	14070c63          	beqz	a4,3b8 <main.c.f1b9d4c6+0x141>
 264:	80018623          	sb	zero,-2036(gp) # 2000000c <crsf_frame_ready>
 268:	47e8                	lw	a0,76(a5)
 26a:	1f300713          	li	a4,499
 26e:	12a74663          	blt	a4,a0,39a <main.c.f1b9d4c6+0x123>
 272:	40011737          	lui	a4,0x40011
 276:	4541                	li	a0,16
 278:	cb08                	sw	a0,16(a4)
 27a:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 27e:	4511                	li	a0,4
 280:	cb48                	sw	a0,20(a4)
 282:	aa1d                	j	3b8 <main.c.f1b9d4c6+0x141>
 284:	00e08223          	sb	a4,4(ra) # 20000004 <len.2>
 288:	02000513          	li	a0,32
 28c:	00e57563          	bgeu	a0,a4,296 <main.c.f1b9d4c6+0x1f>
 290:	8001a423          	sw	zero,-2040(gp) # 20000008 <crsf_state>
 294:	b7e1                	j	25c <main+0x1a4>
 296:	20000737          	lui	a4,0x20000
 29a:	00072023          	sw	zero,0(a4) # 20000000 <crsf_payload_pos.1>
 29e:	4709                	li	a4,2
 2a0:	80e1a423          	sw	a4,-2040(gp) # 20000008 <crsf_state>
 2a4:	bf65                	j	25c <main+0x1a4>
 2a6:	20000437          	lui	s0,0x20000
 2aa:	00042503          	lw	a0,0(s0) # 20000000 <crsf_payload_pos.1>
 2ae:	00150393          	add	t2,a0,1
 2b2:	953e                	add	a0,a0,a5
 2b4:	00e50023          	sb	a4,0(a0)
 2b8:	0040c703          	lbu	a4,4(ra)
 2bc:	00742023          	sw	t2,0(s0)
 2c0:	f8e39ee3          	bne	t2,a4,25c <main+0x1a4>
 2c4:	8001a423          	sw	zero,-2040(gp) # 20000008 <crsf_state>
 2c8:	4761                	li	a4,24
 2ca:	f8e399e3          	bne	t2,a4,25c <main+0x1a4>
 2ce:	0007c503          	lbu	a0,0(a5)
 2d2:	4759                	li	a4,22
 2d4:	f8e514e3          	bne	a0,a4,25c <main+0x1a4>
 2d8:	0007a383          	lw	t2,0(a5)
 2dc:	0083d713          	srl	a4,t2,0x8
 2e0:	7ff77713          	and	a4,a4,2047
 2e4:	d398                	sw	a4,32(a5)
 2e6:	0133d713          	srl	a4,t2,0x13
 2ea:	7ff77713          	and	a4,a4,2047
 2ee:	d3d8                	sw	a4,36(a5)
 2f0:	43d8                	lw	a4,4(a5)
 2f2:	01e3d393          	srl	t2,t2,0x1e
 2f6:	1ff77513          	and	a0,a4,511
 2fa:	050a                	sll	a0,a0,0x2
 2fc:	00756533          	or	a0,a0,t2
 300:	d788                	sw	a0,40(a5)
 302:	00975513          	srl	a0,a4,0x9
 306:	7ff57513          	and	a0,a0,2047
 30a:	d7c8                	sw	a0,44(a5)
 30c:	01475513          	srl	a0,a4,0x14
 310:	7ff57513          	and	a0,a0,2047
 314:	db88                	sw	a0,48(a5)
 316:	4788                	lw	a0,8(a5)
 318:	837d                	srl	a4,a4,0x1f
 31a:	3ff57393          	and	t2,a0,1023
 31e:	0386                	sll	t2,t2,0x1
 320:	00e3e3b3          	or	t2,t2,a4
 324:	0277aa23          	sw	t2,52(a5)
 328:	00a55713          	srl	a4,a0,0xa
 32c:	00c7a383          	lw	t2,12(a5)
 330:	7ff77713          	and	a4,a4,2047
 334:	df98                	sw	a4,56(a5)
 336:	8155                	srl	a0,a0,0x15
 338:	dfc8                	sw	a0,60(a5)
 33a:	7ff3f713          	and	a4,t2,2047
 33e:	4b88                	lw	a0,16(a5)
 340:	c3b8                	sw	a4,64(a5)
 342:	00b3d713          	srl	a4,t2,0xb
 346:	7ff77713          	and	a4,a4,2047
 34a:	c3f8                	sw	a4,68(a5)
 34c:	00157713          	and	a4,a0,1
 350:	0163d393          	srl	t2,t2,0x16
 354:	072a                	sll	a4,a4,0xa
 356:	00776733          	or	a4,a4,t2
 35a:	c7b8                	sw	a4,72(a5)
 35c:	00155713          	srl	a4,a0,0x1
 360:	7ff77713          	and	a4,a4,2047
 364:	c7f8                	sw	a4,76(a5)
 366:	00c55713          	srl	a4,a0,0xc
 36a:	7ff77713          	and	a4,a4,2047
 36e:	cbb8                	sw	a4,80(a5)
 370:	4bd8                	lw	a4,20(a5)
 372:	815d                	srl	a0,a0,0x17
 374:	00377393          	and	t2,a4,3
 378:	03a6                	sll	t2,t2,0x9
 37a:	00a3e3b3          	or	t2,t2,a0
 37e:	00275513          	srl	a0,a4,0x2
 382:	0477aa23          	sw	t2,84(a5)
 386:	7ff57513          	and	a0,a0,2047
 38a:	8335                	srl	a4,a4,0xd
 38c:	cfa8                	sw	a0,88(a5)
 38e:	7ff77713          	and	a4,a4,2047
 392:	cff8                	sw	a4,92(a5)
 394:	80518623          	sb	t0,-2036(gp) # 2000000c <crsf_frame_ready>
 398:	b5d1                	j	25c <main+0x1a4>
 39a:	40011737          	lui	a4,0x40011
 39e:	5dc00293          	li	t0,1500
 3a2:	80070713          	add	a4,a4,-2048 # 40010800 <__global_pointer$+0x20010000>
 3a6:	02a2d963          	bge	t0,a0,3d8 <main.c.f1b9d4c6+0x161>
 3aa:	40011537          	lui	a0,0x40011
 3ae:	42c1                	li	t0,16
 3b0:	00552a23          	sw	t0,20(a0) # 40011014 <__global_pointer$+0x20010814>
 3b4:	4511                	li	a0,4
 3b6:	cb08                	sw	a0,16(a4)
 3b8:	4498                	lw	a4,8(s1)
 3ba:	8f15                	sub	a4,a4,a3
 3bc:	e60757e3          	bgez	a4,22a <main+0x172>
 3c0:	002dc737          	lui	a4,0x2dc
 3c4:	6c070713          	add	a4,a4,1728 # 2dc6c0 <uart_rx.c.26d07654+0x2db31c>
 3c8:	400115b7          	lui	a1,0x40011
 3cc:	96ba                	add	a3,a3,a4
 3ce:	45d8                	lw	a4,12(a1)
 3d0:	01074713          	xor	a4,a4,16
 3d4:	c5d8                	sw	a4,12(a1)
 3d6:	b5a1                	j	21e <main+0x166>
 3d8:	40011537          	lui	a0,0x40011
 3dc:	42c1                	li	t0,16
 3de:	00552a23          	sw	t0,20(a0) # 40011014 <__global_pointer$+0x20010814>
 3e2:	bd71                	j	27e <main.c.f1b9d4c6+0x7>

000003e4 <ADC1_IRQHandler>:
 3e4:	a001                	j	3e4 <ADC1_IRQHandler>

000003e6 <reset_handler>:
 3e6:	0b800793          	li	a5,184
 3ea:	20000197          	auipc	gp,0x20000
 3ee:	41618193          	add	gp,gp,1046 # 20000800 <__global_pointer$>
 3f2:	00018113          	mv	sp,gp
 3f6:	08800513          	li	a0,136
 3fa:	30051073          	csrw	mstatus,a0
 3fe:	458d                	li	a1,3
 400:	80459073          	csrw	0x804,a1
 404:	00000517          	auipc	a0,0x0
 408:	bfc50513          	add	a0,a0,-1028 # 0 <jump_reset>
 40c:	8d4d                	or	a0,a0,a1
 40e:	30551073          	csrw	mtvec,a0
 412:	34179073          	csrw	mepc,a5
 416:	200007b7          	lui	a5,0x20000
 41a:	200006b7          	lui	a3,0x20000
 41e:	45800713          	li	a4,1112
 422:	00078793          	mv	a5,a5
 426:	00068693          	mv	a3,a3
 42a:	00d7ed63          	bltu	a5,a3,444 <reset_handler+0x5e>
 42e:	200007b7          	lui	a5,0x20000
 432:	00078793          	mv	a5,a5
 436:	87018713          	add	a4,gp,-1936 # 20000070 <_ebss>
 43a:	00e7ea63          	bltu	a5,a4,44e <reset_handler+0x68>
 43e:	39b9                	jal	9c <SYS_init>
 440:	30200073          	mret
 444:	4310                	lw	a2,0(a4)
 446:	0711                	add	a4,a4,4
 448:	c390                	sw	a2,0(a5)
 44a:	0791                	add	a5,a5,4 # 20000004 <len.2>
 44c:	bff9                	j	42a <reset_handler+0x44>
 44e:	0007a023          	sw	zero,0(a5)
 452:	0791                	add	a5,a5,4
 454:	b7dd                	j	43a <reset_handler+0x54>
	...
