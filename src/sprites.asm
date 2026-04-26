; sprites.asm
; Contains functions for manipulating sprites

.include "src/macros.asm"

; Draws a sprite at a given x, y coordinate with a given tile index and attributes
; x: X coordinate of the sprite (0-255)
; y: Y coordinate of the sprite (0-239)
; tile: Tile index of the sprite (0-255)
; attr: Attributes of the sprite (e.g. palette, flip)
sprite_draw:
  pha ; Save A
  phx ; Save X
  phy ; Save Y

  lda y
  sta oam_buffer,y
  iny
  lda tile
  sta oam_buffer,y
  iny
  lda attr
  sta oam_buffer,y
  iny
  lda x
  sta oam_buffer,y

  ply ; Restore Y
  plx ; Restore X
  pla ; Restore A
  rts
