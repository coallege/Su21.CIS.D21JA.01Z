; Chapter 8 Exercise 4: ThreeThrees Procedure

COMMENT !
Create a procedure named FindThrees that returns 1 if an array has three 
consecutive values of 3 somewhere in the array. Otherwise, return 0. The 
procedure's input parameter list contains a pointer to the array and the 
array's size. Use the PROC directive with a parameter list when declaring 
the procedure. Preserve all registers (except EAX) that are modified by 
the procedure. Write a test program that calls FindThrees several times 
with different arrays. 
!

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
FindThrees proto aPtr:PTR SDWORD, arraySize:DWORD

.data
Ex5Array1 sdword  4, 6, 3, 3, 2, 5          ; false
Ex5Array2 sdword 3,3,3,9,5                  ; true
Ex5Array3 sdword 1,2,3,3,4,3,3,3,9          ; true
Ex5Array4 sdword 1,2,4,-4,-5,9              ; false

.code
main proc
    invoke FindThrees, ADDR Ex5Array1, LENGTHOF Ex5Array1
    invoke FindThrees, ADDR Ex5Array2, LENGTHOF Ex5Array2
    invoke FindThrees, ADDR Ex5Array3, LENGTHOF Ex5Array3
    invoke FindThrees, ADDR Ex5Array4, LENGTHOF Ex5Array4

    invoke ExitProcess,0
main endp

FindThrees proc,
    aPtr:PTR SDWORD, arraySize:DWORD
    
    push esi
    push ecx
    mov  eax,0          ; initialize repetition count
    mov  esi,aPtr
    mov  ecx,arraySize

L1: cmp  sdword ptr [esi],3
    jne  L2             ; larger than max
    inc  eax            ; increment the count
    cmp  eax,3          ; has it reached 3?
    je   success        ; return with success
    jmp  L2A            ; keep counting

L2: mov  eax,0          ; reset the count
L2A:                    ; point to next array element
    add  esi,4
    loop L1
    jmp  L3             ; failure!

success:
    mov eax,1           ; return True

L3:
    pop ecx
    pop esi
    ret
FindThrees endp

end main