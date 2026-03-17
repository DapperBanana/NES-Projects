; iNES Header for NROM-128 (mapper 0, 16KB PRG, 8KB CHR)
; Include this at the very top of your ROM source
;
; Reference: https://www.nesdev.org/wiki/INES

.segment "HEADER"

.byte "NES", $1A       ; iNES magic number
.byte $01              ; 1 x 16KB PRG-ROM bank
.byte $01              ; 1 x 8KB CHR-ROM bank
.byte $00              ; Mapper 0, horizontal mirroring
.byte $00              ; Mapper 0 upper nybble, NES 1.0
.byte $00              ; No PRG-RAM
.byte $00              ; NTSC
.byte $00, $00, $00, $00, $00, $00  ; Padding
