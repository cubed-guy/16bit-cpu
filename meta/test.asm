; ; TEST1: Add two constant
; DT 4
; MV Stack R  ; Write to R (reads from T), stack is required for instr format
; MV R Stack  ; Data '4' goes into the stack
; DT 5
; OP 9        ; Compute and change SP to point to IO mapped region
; MV R Stack  ; Blit result into output
; DT 5
; OP 9
; label:
; MV R Stack  ; Blit result into output
; MV Stack T
; OP 9
; MV R Stack
; DT label

; TEST2: Fill output
DT 14
MV Stack R  ; move T into R
MV R Stack  ; move R into stack
DT 18
OP 9        ; R is sum of T and stack
; R should now be 0x20
MV+ R Stack ; Push 0x20 to stack
MV+ R Stack ; Push 0x20 to stack, again
MV R Stack  ; Push 0x20
MV Stack T  ; T should now be 0x20
OP+ 9       ; Add and prepare for push
MV R Stack
