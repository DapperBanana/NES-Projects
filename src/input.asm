; input.asm
; Provides basic joystick input reading for NES.

.export input_read

JOYPAD1   = $4016  ; Write to this address to strobe the controller
JOYPAD1_STATUS = $4016 ; Read from this address to get controller status

.segment "CODE"

; Reads joystick 1 input.  Returns the status in A.
; Destroys X
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
joy_status: .res 1 ; Current joypad status (bits for each button)
joy_status_mirror: .res 1 ; Mirror of joy_status for usage in main code segment


; Define button constants (bits in joy_status)
RIGHT   = %00000001
LEFT    = %00000010
DOWN    = %00000100
UP      = %00001000
START   = %00010000
SELECT  = %00100000
B_BUTTON = %01000000
A_BUTTON = %10000000
