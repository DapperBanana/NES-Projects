CA65 = ca65
LD65 = ld65
CFG  = cfg/nrom128.cfg

BUILDDIR = build

.PHONY: all clean hello

all: hello

hello: $(BUILDDIR)/hello.nes

$(BUILDDIR)/hello.nes: src/hello/hello.asm lib/ines_header.inc lib/ppu.inc $(CFG)
	@mkdir -p $(BUILDDIR)
	$(CA65) -o $(BUILDDIR)/hello.o src/hello/hello.asm
	$(LD65) -C $(CFG) -o $@ $(BUILDDIR)/hello.o
	@echo "Built $@"

clean:
	rm -rf $(BUILDDIR)
