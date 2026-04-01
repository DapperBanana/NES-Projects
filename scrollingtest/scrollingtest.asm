; scrollingtest.asm
.include "../lib/nes.in"
.include "../lib/ppu.in"
.include "../lib/input.in"
.inesprg 1
.ineschr 1
.inesmap 0
.inesmir 1

.segment "ZEROPAGE" ; zero page variables
CONTROLLER1: .res 1
SCROLL_X:   .res 1

.segment "CODE" ; main program code
.proc main
  jsr PPU_initialize

  ; Set scroll to 0 initially
  lda #$00
  sta SCROLL_X

  ; Load palette data (simple test)
  lda #$3F
  sta PPUADDR
  lda #$00
  sta PPUADDR
  lda #$11
  sta PPUADDR
  lda #$22
  sta PPUADDR
  lda #$33
  sta PPUADDR

  ; Load pattern table (tile data) - all tiles are solid color for test
  lda #$20  ; $2000
  sta PPUADDR
  lda #$00
  sta PPUADDR

  ldx #$00
PT_LOAD:
  lda #$AA ; sample pattern (alternating bits)
  sta PPUDATA
  inx
  cpx #$40  ; Load 64 bytes (8 tiles)
  bne PT_LOAD

  ; Load name table (map) - simple repeating pattern
  lda #$20
  sta PPUADDR
  lda #$00  ; $2000 - Name Table 0
  sta PPUADDR

  ldx #$00
NT_LOAD:
  lda #$01 ; tile number 1
  sta PPUDATA
  inx
  cpx #$400 ; Fill whole nametable
  bne NT_LOAD

main_loop:
  ; Read controller 1 input
  jsr read_controller_1

  ; Check for right input to scroll
  lda CONTROLLER1
  and #%00000010 ; Check Right
  beq no_scroll
    inc SCROLL_X
    lda SCROLL_X
    sta PPU_SCROLL ; Horizontal scroll
no_scroll:

  ; Wait for VBlank
  jsr PPU_wait_vblank

  ; Update PPU scroll registers

  jmp main_loop
.endproc