all: hello.nes mariotest/mariotest.nes scrollingtest/scrollingtest.nes

hello.nes: hello.asm
	ca65 hello.asm
	ld65 -C nes.cfg -o hello.nes hello.o lib/nes.o lib/ppu.o lib/input.o

mariotest/mariotest.nes: mariotest/mariotest.asm
	$(MAKE) -C mariotest

scrollingtest/scrollingtest.nes: scrollingtest/scrollingtest.asm
	$(MAKE) -C scrollingtest

clean:
	rm -f *.o *.nes
	$(MAKE) -C mariotest clean
	$(MAKE) -C scrollingtest clean

run:
	mednafen hello.nes
	mednafen mariotest/mariotest.nes
	mednafen scrollingtest/scrollingtest.nes
