; macros.asm

; .res macro - reserves memory initialized to 0.
; Usage: .res <length>
.macro .res len
    .res len
    .fill len, 0
.endmacro