; sprite.asm
; Sprite drawing routines

.export sprite_draw

sprite_draw:
  ; Args:
  ;   X: Sprite index (0-63)
  ;   A: Tile index
  ;   Y: Y position
  ;   sprite_attribs: Attributes (palette, flip, etc) passed in from zp

  lda sprite_attribs,x  ; Load sprite attributes from zeropage
  sta oam_attrib,x      ; Store attributes in OAM

  lda sprite_y,x        ; Load Y position
  sta oam_y,x           ; Store Y position in OAM

  lda sprite_tile,x     ; Load tile index from zero page
  sta oam_tile,x        ; Store tile index in OAM

  lda sprite_x,x        ; Load X position
  sta oam_x,x           ; Store X position in OAM

  rts