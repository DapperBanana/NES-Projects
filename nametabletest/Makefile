TARGET  = nametabletest
ASM     = ca65
LD      = ld65
CFG     = ../lib/nrom128.cfg

OBJS    = main.o

.PHONY: all clean

all: $(TARGET).nes

main.o: main.asm ../lib/ines.in ../lib/ppu.in
	$(ASM) -o $@ $<

$(TARGET).nes: $(OBJS)
	$(LD) -C $(CFG) -o $@ $(OBJS)

clean:
	rm -f $(OBJS) $(TARGET).nes
