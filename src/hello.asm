; hello.asm
; Minimal hello world for NES

.include "../inc/nes.in"
.include "../inc/ppu.in"
.include "../inc/input.in"


.segment "ZEROPAGE"

; PPU Registers
PPU_CTRL = $2000
PPU_MASK = $2001
PPU_STATUS = $2002
PPU_OAMADDR = $2003
PPU_OAMDATA = $2004
PPU_SCROLL = $2005
PPU_ADDR = $2006
PPU_DATA = $2007
OAM_DMA = $4014

JOYPAD1   = $4016
JOYPAD1_STATUS = $4016

.segment "CODE"

.proc main
  ; Initialize PPU
  jsr ppu_init

  ; Set background color to blue (palette entry $3F01)
  lda #$3F
  sta PPU_ADDR
  lda #$01
  sta PPU_ADDR

  lda #$0F ;blue
  sta PPU_DATA

main_loop:
  jsr input_read

  lda joy_status_mirror
  and #A_BUTTON
  beq no_a
  lda #$0F
  sta PPU_DATA
no_a:
  ; Infinite loop
  jmp main_loop
.endproc



.segment "VECTORS"
.word nmi
.word reset
.word irq

.segment "INES_HEADER"
.byte $4E, $45, $53, $1A ; NES header identifier
.byte $01 ; PRG-ROM size: 1 x 16KB
.byte $01 ; CHR-ROM size: 1 x 8KB
.byte $00 ; Flags 6: Mapper 0, mirroring type
.byte $00 ; Flags 7: TV system, PRG-RAM presence
.byte $00 ; PRG-RAM size
.byte $00 ; Flags 9: TV system
.byte $00 ; Flags 10: Unused

nmi:
  rti

reset:
  sei       ; Disable interrupts
  cld       ; Disable decimal mode

  ; Initialize stack pointer
  ldx #$FF
  txs

  jsr main

irq:
  rti
