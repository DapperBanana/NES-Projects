;; NES Controller Input Module
;;
;; Reads the state of the two NES controllers
;;
;; Public functions:
;;   read_controllers: Reads controller states into controller1_state and controller2_state

.export read_controllers
.export controller1_state
.export controller2_state

.segment "ZEROPAGE"

controller_strobe: .res 1 ; Zero page location for controller strobe bit
controller1_state: .res 1 ; Zero page location for controller 1 state
controller2_state: .res 1 ; Zero page location for controller 2 state

.segment "CODE"

read_controllers:
    ; Strobe the controllers to capture input
    lda #$01
    sta $4016
    lda #$00
    sta $4016

    ; Read controller 1
    ldx #$08 ; 8 bits to read
read_controller1_loop:
    lda $4016
    lsr a        ; Least significant bit contains controller state
    rol controller1_state
    dex
    bne read_controller1_loop

    ; Read controller 2
    ldx #$08
read_controller2_loop:
    lda $4017
    lsr a
    rol controller2_state
    dex
    bne read_controller2_loop

    rts