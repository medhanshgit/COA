	.file	"q-x86.c"
	.text
	.globl	fibbo
	.type	fibbo, @function
fibbo:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -68(%rbp)
	fld1
	fstpt	-48(%rbp)
	fld1
	fstpt	-32(%rbp)
	fldz
	fstpt	-16(%rbp)
	cmpl	$1, -68(%rbp)
	jne	.L2
	fldt	-48(%rbp)
	jmp	.L3
.L2:
	cmpl	$2, -68(%rbp)
	jne	.L4
	fldt	-32(%rbp)
	jmp	.L3
.L4:
	movl	$3, -52(%rbp)
	jmp	.L5
.L6:
	fldt	-48(%rbp)
	fldt	-32(%rbp)
	faddp	%st, %st(1)
	fstpt	-16(%rbp)
	fldt	-32(%rbp)
	fstpt	-48(%rbp)
	fldt	-16(%rbp)
	fstpt	-32(%rbp)
	addl	$1, -52(%rbp)
.L5:
	movl	-52(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jle	.L6
	fldt	-16(%rbp)
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fibbo, .-fibbo
	.section	.rodata
.LC3:
	.string	"%d %Lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	fibbo
	movl	-4(%rbp), %eax
	addl	$1, %eax
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	addl	$1, -4(%rbp)
.L8:
	cmpl	$99, -4(%rbp)
	jle	.L9
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
