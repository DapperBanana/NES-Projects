; sprites.asm
; Contains functions for manipulating sprites

.include "src/macros.asm"

; sprite_draw
; Draws a sprite at a given index in OAM
; Expects X to be the index into OAM (0-255, *4 for sprite number)
; a = tile
; x = OAM index
; y = y coordinate
; Assumes attributes set elsewhere. Fast call. 
sprite_draw:
  pha ; Save A
  phy ; Save Y

  lda y
  sta oam_buffer,x
  inx
  lda a
  sta oam_buffer,x
  inx
  lda sprite_attr
  sta oam_buffer,x
  inx
  lda sprite_x
  sta oam_buffer,x

  ply ; Restore Y
  pla ; Restore A
  rts

.segment "ZEROPAGE"
sprite_x: .res 1 ; X coordinate of the sprite
sprite_y: .res 1 ; Y coordinate of the sprite
sprite_attr: .res 1 ; Attributes of the sprite
