; zeropage.asm
; Zero page memory definitions

.segment "ZEROPAGE"

joy_status: .res 1 ; Joystick status
joy_status_prev: .res 1 ; Previous joystick status

sprite_count: .res 1 ; Number of sprites to draw
sprite_attribs: .res 64 ; Sprite attributes (palette, flip, etc)
sprite_x: .res 64 ; X position of sprites
sprite_y: .res 64 ; Y position of sprites
sprite_tile: .res 64 ; Sprite tile index