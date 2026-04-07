.include "src/header.asm"
.include "src/ppu.in"
.include "src/input.asm"

.segment "CODE"

  ;; Initialize PPU
  jsr ppu_init

  ;; Set background color to blue
  lda #$0F  ; Color index for blue
  sta $2001  ; PPU Mask register (enable color emphasis)

main_loop:
  jsr read_controllers
  jmp main_loop

.segment "VECTORS"

.word nmi
.word reset
.word irq

nmi:
  rti

reset:
  ;; Initialize stack pointer
  ldx #$FF
  txs

  ;; Initialize PPU
  jsr ppu_init

  jmp main_loop

irq:
  rti