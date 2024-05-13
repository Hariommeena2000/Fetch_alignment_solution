	.file	"demo.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Enter operator (+, -, *, /): \0"
.LC1:
	.ascii "%c\0"
.LC2:
	.ascii "Enter two numbers: \0"
.LC3:
	.ascii "%lf %lf\0"
	.align 8
.LC5:
	.ascii "Error! Division by zero is not allowed.\0"
.LC6:
	.ascii "Error! Invalid operator.\0"
.LC7:
	.ascii "Result: %lf\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-9(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	movzbl	-9(%rbp), %eax
	cmpb	$43, %al
	jne	.L2
	movsd	-24(%rbp), %xmm1
	movsd	-32(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L2:
	movzbl	-9(%rbp), %eax
	cmpb	$45, %al
	jne	.L4
	movsd	-24(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L4:
	movzbl	-9(%rbp), %eax
	cmpb	$42, %al
	jne	.L5
	movsd	-24(%rbp), %xmm1
	movsd	-32(%rbp), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L5:
	movzbl	-9(%rbp), %eax
	cmpb	$47, %al
	jne	.L6
	movsd	-32(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jp	.L7
	pxor	%xmm1, %xmm1
	ucomisd	%xmm1, %xmm0
	jne	.L7
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L10
.L7:
	movsd	-24(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	.L3
.L6:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	$1, %eax
	jmp	.L10
.L3:
	movsd	-8(%rbp), %xmm0
	movq	-8(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
.L10:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders) 13.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
