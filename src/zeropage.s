; zeropage.s
; Zero page assignments

.segment "ZEROPAGE"

joy_status:   .res 1 ; Joystick status (mirrored)
joy_status2:  .res 1 ; Joystick status

; Sprite data
sprite_y:   .res 1 ; Y position of sprite
sprite_x:   .res 1 ; X position of sprite
sprite_attr:  .res 1 ; Attribute of sprite
sprite_tile:  .res 1 ; Tile index of sprite
sprite_count: .res 1 ; Number of sprites to draw
