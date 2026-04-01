NAME := scrollingtest
SOURCES := $(NAME).asm

all: $(NAME).nes

$(NAME).nes: $(SOURCES)
	ca65 $(SOURCES)
	ld65 -C ../nes.cfg -o $(NAME).nes $(NAME).o ../lib/nes.o ../lib/ppu.o ../lib/input.o

clean:
	rm -f *.o *.nes

run:
	mednafen $(NAME).nes
