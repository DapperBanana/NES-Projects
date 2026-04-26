.include "src/header.asm"
.include "src/macros.asm"
.include "src/ppu.asm"
.include "src/input.asm"
.include "src/sprites.asm"

.segment "CODE"

reset:
  jsr ppu_init
  jsr oam_init

  ; Set sprite attributes (palette 0, no flips)
  lda #%00000000
  sta sprite_attr
  lda #64
  sta sprite_x
  lda #64
  sta sprite_y

main_loop:
  ; Draw a sprite at (64, 64), tile index 0
  ldx #0  ; OAM index (sprite 0)
  lda #0  ; Tile index
  jsr sprite_draw

  ; Draw another sprite at (128, 128), tile index 1
  lda #128
  sta sprite_x
  lda #128
  sta sprite_y
  ldx #4  ; OAM index (sprite 1)
  lda #1  ; Tile index
  jsr sprite_draw

  jsr input_read
  lda joy_status
  cmp #$01 ; Check if A button is pressed
  beq button_pressed

  jmp main_loop

button_pressed:
  ; Do something when the button is pressed
  rts

.segment "VECTORS"
.word nmi
.word reset
.word irq

nmi:
  rti
irq:
  rti
