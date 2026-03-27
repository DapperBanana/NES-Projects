.include "../lib/nes.in"
.include "../lib/ppu.in"
.include "../lib/input.in"

.segment "INESHDR"
  .res iNESHeader.sizeof

.segment "CODE"

  ; Set background color to blue
  lda #$0F ; Dark blue
  sta $2001

  lda #$00
  sta $2006
  lda #$20
  sta $2006
  lda #$3F
  sta $2007


main:
  jsr ppu_init
  jsr read_input
loop:
  jmp loop