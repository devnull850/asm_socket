all: exe

exe: min
	chmod +x a.out
	rm test test.o

min: test
	dd if=test of=a.out bs=1 count=120
	dd if=raw of=a.out bs=1 seek=120 count=40
	dd if=test of=a.out bs=1 seek=160 skip=4096 count=226
	dd if=raw of=a.out bs=1 count=1 seek=24 skip=16 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=6 seek=58 conv=notrunc
	dd if=raw of=a.out bs=1 seek=68 count=1 skip=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=72 conv=notrunc
	dd if=raw of=a.out bs=1 count=1 skip=16 seek=72 conv=notrunc
	dd if=raw of=a.out bs=1 count=1 skip=16 seek=80 conv=notrunc
	dd if=raw of=a.out bs=1 count=1 skip=16 seek=88 conv=notrunc

test: test.o
	ld -T test.ld -o test test.o

test.o: test.s
	as -o test.o test.s

.PHONY:
clean:
	rm a.out
