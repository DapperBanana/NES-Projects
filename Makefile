ASM65_PATH = /opt/homebrew/bin/ca65
LD65_PATH = /opt/homebrew/bin/ld65

all: hello.nes scrollingtest.nes nametabletest.nes

hello.o: src/hello.asm src/header.asm src/ppu.in src/input.asm
	$(ASM65_PATH) -t none -o hello.o src/hello.asm

hello.nes: hello.o nes.cfg
	$(LD65_PATH) -t none -C nes.cfg -o hello.nes hello.o

scrollingtest.o: src/scrollingtest.asm src/header.asm src/ppu.in
	$(ASM65_PATH) -t none -o scrollingtest.o src/scrollingtest.asm

scrollingtest.nes: scrollingtest.o nes.cfg
	$(LD65_PATH) -t none -C nes.cfg -o scrollingtest.nes scrollingtest.o

nametabletest.o: src/nametabletest.asm src/header.asm src/ppu.in
	$(ASM65_PATH) -t none -o nametabletest.o src/nametabletest.asm

nametabletest.nes: nametabletest.o nes.cfg
	$(LD65_PATH) -t none -C nes.cfg -o nametabletest.nes nametabletest.o

clean:
	rm -f *.o *.nes