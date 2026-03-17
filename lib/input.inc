; Controller input reading for NES
; Reads joypad 1 state into `pad1` in zeropage
;
; Button bitmask (active high after read):
;   bit 7 = A
;   bit 6 = B
;   bit 5 = Select
;   bit 4 = Start
;   bit 3 = Up
;   bit 2 = Down
;   bit 1 = Left
;   bit 0 = Right

JOYPAD1 = $4016
JOYPAD2 = $4017

.segment "ZEROPAGE"
pad1:       .res 1
pad1_prev:  .res 1
pad1_new:   .res 1             ; buttons pressed this frame (not held)

.segment "CODE"

.proc read_joypad
    ; Save previous frame state for edge detection
    lda pad1
    sta pad1_prev

    ; Strobe controller
    lda #$01
    sta JOYPAD1
    lda #$00
    sta JOYPAD1

    ; Read 8 buttons, shift into pad1
    ldx #$08
@loop:
    lda JOYPAD1
    lsr a                  ; bit 0 -> carry
    rol pad1               ; carry -> pad1 bit 0, shift left
    dex
    bne @loop

    ; Compute newly pressed buttons
    lda pad1
    eor pad1_prev
    and pad1               ; only bits that are 1 now and were 0 before
    sta pad1_new

    rts
.endproc
