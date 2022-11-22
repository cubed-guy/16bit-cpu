; TEST1: Add two constant
DT 56
MV Stack R  ; Write to R (reads from T), stack is required for instr format
MV R Stack  ; Data '56' goes into the stack
DT 24
OP 9       ; Compute and change SP to point to IO mapped region
MV R Stack  ; Blit result into output
