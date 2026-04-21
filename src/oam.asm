; oam.asm - OAM management functions

.export oam_dma

; oam_dma
; Transfers 256 bytes from RAM to OAM using DMA
; Expects the high byte of the source address in A
oam_dma:
    pha         ; Store accumulator
    lda #$02    ; OAM DMA address
    sta $2003   ; Write OAM address
    lda #$4014   ; OAM DMA transfer
    sta $4014   ; Start DMA transfer
    pla         ; Restore accumulator
    rts