; input.asm
; Reads joystick input

.export input_read
.export joy_status

.zeropage
joy_status_mirror: .res 1 ; Mirrored joy_status for safe access

.bss
joy_status: .res 1 ; Current joystick status

;------------------------------------------------------------------------------
; Subroutine: input_read
; Reads the status of the joystick into memory.
; Overwrites A, X, and Y registers
;------------------------------------------------------------------------------
input_read:
  LDA #$01        ; Strobe the joystick
  STA $4016
  STA $4016

  LDX #$08        ; 8 bits to read
read_loop:
  LDA $4016       ; Read the joystick
  AND #$01        ; Get the bit
  LSR A           ; Shift to correct position
  ROR joy_status  ; Rotate into joy_status (LSB first)

  DEX
  BNE read_loop

  LDA joy_status
  STA joy_status_mirror

  RTS
