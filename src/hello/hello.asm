; hello.asm — Minimal NES ROM that sets the background to blue
; Proves the toolchain works end to end

.include "../../lib/ines_header.inc"
.include "../../lib/ppu.inc"

.segment "CODE"

.proc reset
    sei
    cld
    ldx #$FF
    txs

    jsr ppu_init

    ; Set palette: write blue ($01) to universal background at $3F00
    bit PPUSTATUS          ; reset address latch
    lda #$3F
    sta PPUADDR
    lda #$00
    sta PPUADDR
    lda #$01               ; blue
    sta PPUDATA

    ; Reset scroll
    lda #$00
    sta PPUSCROLL
    sta PPUSCROLL

    ; Enable rendering
    lda #%10000000         ; NMI on vblank
    sta PPUCTRL
    lda #%00001110         ; show bg + sprites
    sta PPUMASK

@forever:
    jmp @forever
.endproc

.proc nmi
    rti
.endproc

.proc irq
    rti
.endproc

.segment "VECTORS"
    .addr nmi
    .addr reset
    .addr irq

.segment "CHARS"
    ; Empty CHR bank — 8KB of zeros (filled by linker)
