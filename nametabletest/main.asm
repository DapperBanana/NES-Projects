; nametabletest/main.asm
; Exercise nametable_clear_impl and basic tile drawing

.include "../lib/ines.in"
.include "../lib/ppu.in"

.segment "ZEROPAGE"
nmt_hi:     .res 1
nmt_lo:     .res 1
nmt_tile:   .res 1

.segment "OAM"
    .res 256

.segment "CODE"

RESET:
    sei
    cld
    ldx #$ff
    txs

    ; disable rendering while we set up
    ppu_off

    ; wait two vblanks for PPU to stabilize
    ppu_wait_vblank
    ppu_wait_vblank

    ; clear zeropage
    lda #$00
    tax
@zp_clear:
    sta $00,x
    inx
    bne @zp_clear

    ; clear the first nametable ($2000) with tile $00
    lda #$20
    sta nmt_hi          ; $00 zp slot
    sta $00
    lda #$00
    sta nmt_lo          ; $01 zp slot
    sta $01
    sta nmt_tile        ; $02 zp slot - tile index 0
    sta $02
    jsr nametable_clear_impl

    ; now draw a stripe of tile $01 across row 10
    ; row 10 starts at $2000 + 10*32 = $2140
    ppu_set_addr $2140
    lda #$01
    ldx #32
@stripe:
    sta $2007
    dex
    bne @stripe

    ; reset scroll
    ppu_set_scroll #0, #0

    ; turn rendering on
    ppu_on

Forever:
    jmp Forever

NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
    .word NMI
    .word RESET
    .word IRQ

.segment "CHARS"
    ; 8KB CHR-ROM: first two tiles defined, rest zeroed
    ; tile 0: blank
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    .byte $00,$00,$00,$00,$00,$00,$00,$00
    ; tile 1: solid block
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
    ; pad remaining CHR to 8192 bytes
    .res (8192 - 32)
