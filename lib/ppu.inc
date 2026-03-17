; PPU initialization and utility routines
; Follows the standard NES power-on init sequence from nesdev wiki

PPUCTRL   = $2000
PPUMASK   = $2001
PPUSTATUS = $2002
PPUSCROLL = $2005
PPUADDR   = $2006
PPUDATA   = $2007

.proc ppu_init
    ; Disable rendering during init
    lda #$00
    sta PPUCTRL
    sta PPUMASK

    ; Wait for first vblank
    bit PPUSTATUS
@vblank1:
    bit PPUSTATUS
    bpl @vblank1

    ; Clear RAM $0000-$07FF while waiting for PPU
    lda #$00
    ldx #$00
@clear_ram:
    sta $0000, x
    sta $0100, x
    sta $0200, x
    sta $0300, x
    sta $0400, x
    sta $0500, x
    sta $0600, x
    sta $0700, x
    inx
    bne @clear_ram

    ; Wait for second vblank — PPU is now stable
@vblank2:
    bit PPUSTATUS
    bpl @vblank2
    rts
.endproc

.proc ppu_wait_vblank
    bit PPUSTATUS
@wait:
    bit PPUSTATUS
    bpl @wait
    rts
.endproc
