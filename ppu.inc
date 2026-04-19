; ppu.inc - PPU definitions and macros

; PPU Registers
PPUCTRL  = $2000
PPUSTATUS = $2002
PPUADDR  = $2006
PPU_DATA = $2007
OAMADDR = $2003
OAM_DATA = $2004
PPUSCROLL = $2005
OAMDMA = $4014

; Macros
.macro ppu_set_addr address
    lda #>address
    sta PPUADDR
    lda #<address
    sta PPUADDR
.endmacro

.macro ppu_set_scroll x, y
    lda #x
    sta PPUSCROLL
    lda #y
    sta PPUSCROLL
.endmacro

.macro nametable_clear_impl tile
    ldx #$00
clear_loop:
    lda #tile
    sta PPU_DATA
    inx
    cpx #$00
    beq clear_done
    jmp clear_loop
clear_done:
.endmacro

.macro oam_set_sprite sprite_index, y, tile_index, attributes, x
    lda y
    sta OAM_DATA
    lda tile_index
    sta OAM_DATA
    lda attributes
    sta OAM_DATA
    lda x
    sta OAM_DATA
.endmacro