.include "header.inc"
.include "macros.inc"
.include "zeropage.s"

.segment "CODE"

.proc main
  ; Initialize PPU
  jsr ppu_init
  jsr oam_init

  ; Set a background color (blue)
  lda #$0F
  sta $2001

main_loop:
  ; Read joystick input
  jsr input_read

  ; Set sprite data for testing
  lda #$40 ; Y position
  sta sprite_y

  lda #$40 ; X position
  sta sprite_x

  lda #$00 ; Attribute
  sta sprite_attr

  lda #$01 ; Tile index
  sta sprite_tile

  lda #$01 ; One Sprite to draw
  sta sprite_count

  ; Draw sprites
  jsr sprite_draw

  ; Wait for VBLANK
  jsr ppu_wait_vblank

  jmp main_loop
.endproc

.segment "VECTORS"

.word nmi
.word reset
.word irq

.proc nmi
  rti
.endproc

.proc reset
  ; Initialize stack pointer
  ldx #$FF
  txs

  jsr main

  rts
.endproc

.proc irq
  rti
.endproc