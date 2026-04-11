; input.asm
; Provides basic joystick input reading

.export input_read

JOYPAD1   = $4016
JOYPAD1_STATUS = $4016

.segment "CODE"

; Reads joystick 1 input.  Returns the status in A.
; Destroys X, Y
input_read:
  ; Strobe the joystick to reset the shift register
  lda #$01
  sta JOYPAD1
  lda #$00
  sta JOYPAD1

  ; Read the joystick data bit by bit
  ldx #$08  ; Read 8 bits (one for each button)
read_loop:
  lda JOYPAD1_STATUS
  lsr         ; Get the next bit into carry
  rol joy_status ; Rotate carry into the joy_status byte
  dex
  bne read_loop

  lda joy_status
  sta joy_status_mirror ;update mirror as well
  rts

.segment "ZEROPAGE"
joy_status: .res 1
joy_status_mirror: .res 1


; Define button constants (bits in joy_status)
RIGHT   = %00000001
LEFT    = %00000010
DOWN    = %00000100
UP      = %00001000
START   = %00010000
SELECT  = %00100000
B_BUTTON = %01000000
A_BUTTON = %10000000
