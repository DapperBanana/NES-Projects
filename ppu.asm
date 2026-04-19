; ppu.asm - PPU initialization and helper functions

.include "ppu.inc"

.segment "CODE"

oam_init:
    lda #$00
    sta OAMADDR
    ldx #$00
init_loop:
    lda #$FF
    sta OAM_DATA
    inx
    cpx #$00
    beq init_done
    jmp init_loop
init_done:
    rts