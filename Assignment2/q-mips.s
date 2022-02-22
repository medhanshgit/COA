	.file	1 "q-mips.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	fibbo
	.set	nomips16
	.set	nomicromips
	.ent	fibbo
	.type	fibbo, @function
fibbo:
	.frame	$fp,40,$31		# vars= 32, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	sdc1	$f0,8($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	sdc1	$f0,16($fp)
	sw	$0,28($fp)
	sw	$0,24($fp)
	lw	$3,40($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L2
	nop

	ldc1	$f0,8($fp)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L2:
	lw	$3,40($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L4
	nop

	ldc1	$f0,16($fp)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L4:
	li	$2,3			# 0x3
	sw	$2,4($fp)
	.option	pic0
	b	$L5
	nop

	.option	pic2
$L6:
	ldc1	$f2,8($fp)
	ldc1	$f0,16($fp)
	add.d	$f0,$f2,$f0
	sdc1	$f0,24($fp)
	ldc1	$f0,16($fp)
	sdc1	$f0,8($fp)
	ldc1	$f0,24($fp)
	sdc1	$f0,16($fp)
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L5:
	lw	$3,4($fp)
	lw	$2,40($fp)
	slt	$2,$2,$3
	beq	$2,$0,$L6
	nop

	ldc1	$f0,24($fp)
$L3:
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	fibbo
	.size	fibbo, .-fibbo
	.rdata
	.align	2
$LC1:
	.ascii	"%d %Lf\012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$16,36($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$0,28($fp)
	.option	pic0
	b	$L8
	nop

	.option	pic2
$L9:
	lw	$2,28($fp)
	addiu	$16,$2,1
	lw	$4,28($fp)
	.option	pic0
	jal	fibbo
	nop

	.option	pic2
	lw	$28,16($fp)
	mfc1	$3,$f0
	mfhc1	$2,$f0
	mfc1	$7,$f0
	mfhc1	$6,$f0
	move	$5,$16
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L8:
	lw	$2,28($fp)
	slt	$2,$2,100
	bne	$2,$0,$L9
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,36($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC0:
	.word	1072693248
	.word	0
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
