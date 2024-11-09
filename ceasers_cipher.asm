; Initialize HL register pair to address 0000H
LXI H, 0000H

; The following blocks load ASCII values into memory sequentially, representing an encoded message.
; Each 'MVI M,xx' instruction sets the memory location pointed to by HL to a specific ASCII value.
; 'INX H' increments the HL register pair to point to the next memory location.

MVI M,90  ; Load ASCII for 'Z' into memory
INX H     ; Increment HL to point to the next memory location

MVI M,72  ; Load ASCII for 'H'
INX H

MVI M,20  ; Load ASCII for ' ' (space)
INX H

MVI M,82  ; Load ASCII for 'R'
INX H

MVI M,87  ; Load ASCII for 'W'
INX H

MVI M,68  ; Load ASCII for 'D'
INX H

MVI M,20  ; Load ASCII for ' ' (space)
INX H

MVI M,75  ; Load ASCII for 'K'
INX H

MVI M,68  ; Load ASCII for 'D'
INX H

MVI M,87  ; Load ASCII for 'W'
INX H

MVI M,72  ; Load ASCII for 'H'
INX H

MVI M,20  ; Load ASCII for ' ' (space)
INX H

MVI M,66  ; Load ASCII for 'B'
INX H

MVI M,72  ; Load ASCII for 'H'
INX H

MVI M,86  ; Load ASCII for 'V'
INX H

MVI M,20  ; Load ASCII for ' ' (space)
INX H

MVI M,82  ; Load ASCII for 'R'
INX H

MVI M,87  ; Load ASCII for 'W'
INX H

MVI M,68  ; Load ASCII for 'D'
INX H

; Reset HL to point to the start of the encoded message
LXI H, 0000H
; Jump to the main routine to start processing
JMP BLOCKLOOP

; Sub-routine: DECODE
; Decodes the number and stores it in the respective memory address
; Parameters: H -> Memory address, B -> Key
; Return: None
DECODE: PUSH H    ; Save the current address on the stack
PUSH B    ; Save the current key on the stack
MOV A, M  ; Load the encoded byte into the accumulator
SUB B     ; Add the key to the accumulator (decode the byte)
MOV M, A  ; Store the decoded byte back into memory
POP B     ; Retrieve the key from the stack
POP H     ; Retrieve the address from the stack
RET       ; Return from the subroutine

; Sub-routine: COMPARE
; Compares two consecutive numbers and checks if the conditions are met
; Parameters: B -> First number, C -> Second number, D -> Condition
; Return: Z flag (Yes if the conditions are met, No otherwise)
COMPARE: PUSH B    ; Save the first and the second number on the stack
PUSH D    ; Save the condition on the stack
MOV A, B  ; Load the first number into the accumulator
SUB C     ; Subtract the second number from the accumulator
CMP D     ; Compare the result with the condition
POP D     ; Retrieve the condition from the stack
POP B     ; Retrieve the first and the second number from the stack
RET       ; Return from the subroutine

; Main Routine
BLOCKLOOP: MOV B, M     ; Load the next value into register B
INX H        ; Increment HL to point to the next memory location
MOV C, M     ; Load the next value into register C
MVI D, -5    ; Set D to -5 (condition for comparison)
CALL COMPARE ; Call the COMPARE subroutine
JNZ BLOCKLOOP; If the zero flag is not set, jump back to BLOCKLOOP
MOV B, M     ; Load the next value into register B
INX H        ; Increment HL
MOV C, M     ; Load the next value into register C
MVI D, 19    ; Set D to 19 (condition for comparison)
CALL COMPARE ; Call the COMPARE subroutine
DCX H        ; Decrement HL
JNZ BLOCKLOOP; If the zero flag is not set, jump back to BLOCKLOOP

MOV A, C     ; Load the second number into the accumulator
MVI D, 65    ; Set D to 65 (ASCII for 'A')
SUB D        ; Subtract 65 from the accumulator
MOV B, A     ; Move the result to register B

LXI H, 0000H ; Set HL to 0000H

; Loop to decode the inputted phrase
DECODELOOP: CALL DECODE ; Call the DECODE subroutine
INX H       ; Increment HL
MOV A, M    ; Load the next byte into the accumulator
MVI D, 0    ; Set D to 0 (condition for comparison)
CMP D       ; Compare the byte with 0
JZ END      ; If the byte is 0, jump to END
JMP DECODELOOP ; Otherwise, jump back to DECODELOOP

END: MOV A, B    ; Load the key into the accumulator
HLT         ; Halt the processor
