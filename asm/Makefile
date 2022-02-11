all: min

min: test
	dd if=test of=a.out bs=1 count=120
	dd if=test of=a.out bs=1 seek=120 skip=4096 count=321

test: test.o
	ld -T test.ld -o test test.o

test.o: test.s
	as -o test.o test.s

.PHONY:
clean:
	rm test.o test a.out
