all: min

min: test
	dd if=test of=a.out bs=1 count=176
	dd if=test of=a.out bs=1 seek=176 skip=4096 count=384
	dd if=test of=a.out bs=1 seek=560 skip=8192 count=48

test: test.o
	ld -T test.ld -o test test.o

test.o: test.s
	as -o test.o test.s

.PHONY:
clean:
	rm test.o test a.out
