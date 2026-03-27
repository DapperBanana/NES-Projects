AS=ca65
LD=ld65

CFLAGS = -I ../lib

all: mariotest.nes

mariotest.o: mariotest.asm
	$(AS) $(CFLAGS) -o mariotest.o mariotest.asm

mariotest.nes: mariotest.o ../nrom-128.cfg
	$(LD) -C ../nrom-128.cfg -o mariotest.nes mariotest.o

clean:
	rm -f *.o *.nes