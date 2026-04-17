; ppu.inc
; Defines and macros for PPU control

; PPU Registers
PPUCTRL = $2000
PPUSTATUS = $2002
PPUADDR = $2006
PPUData = $2007
PPUscroll = $2005
OAMADDR = $2003
OAMDATA = $2004

.macro ppu_set_addr addr
  LDA >addr
  STA PPUADDR
  LDA <addr
  STA PPUADDR
.endmacro

.macro ppu_set_scroll x, y
  LDA x
  STA PPUscroll
  LDA y
  STA PPUscroll
.endmacro

.macro nametable_clear_impl tile
  LDA tile
  LDX #$00
clear_loop:
  STA PPUData
  INX
  BNE clear_loop
.endmacro

.macro oam_set_sprite y, tile, attribute, x
  LDA y
  STA OAMDATA
  LDA tile
  STA OAMDATA
  LDA attribute
  STA OAMDATA
  LDA x
  STA OAMDATA
.endmacro