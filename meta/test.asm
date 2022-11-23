; ; TEST1: Add three constants
; DT 4
; MV Stack R  ; Write to R (reads from T), stack is required for instr format
; MV R Stack  ; Data '4' goes into the stack
; DT 5
; OP 9        ; Add T with top of the stack into R
; MV R Stack  ; Blit result into output
; DT 6
; OP 9
; MV R Stack  ; Blit result into output

; ; TEST2: Fill output
; DT 14
; MV Stack R  ; Move T into R
; DT 15
; ; Push R to stack 4 times
; MV+ R Stack
; MV+ R Stack
; MV+ R Stack
; MV R Stack
; MV- Stack T

; TEST3: Different OP
DT 0x1010
OP 0x00
OP 0x01
OP 0x02
OP 0x03
OP 0x04
OP 0x05
OP 0x06
OP 0x07
OP 0x08
OP 0x09
OP 0x0A
OP 0x0B
OP 0x0C
OP 0x0D
OP 0x0E
OP 0x0F
OP 0x10
OP 0x11
OP 0x12
OP 0x13
OP 0x14
OP 0x15
OP 0x16
OP 0x17
OP 0x18
OP 0x19
OP 0x1A
OP 0x1B
OP 0x1C
OP 0x1D
OP 0x1E
OP 0x1F
