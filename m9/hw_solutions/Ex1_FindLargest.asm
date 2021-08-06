; Chapter 8 Exercise 1: FindLargest Procedure

COMMENT !
Create a procedure named FindLargest that receives two parameters: a pointer 
to a signed doubleword array, and a count of the array's length. The procedure 
must return the value of the largest array member in EAX. Use the PROC directive 
with a parameter list when declaring the procedure. Preserve all registers 
(except EAX) that are modified by the procedure. Write a test program that calls 
FindLargest and passes three different arrays of different lengths. Be sure to 
include negative values in your arrays. Create a PROTO declaration for FindLargest.
!

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
FindLargest proto aPtr:PTR SDWORD, arraySize:DWORD

.data
Ex1Array sdword 10,-20,30,50,40,-2          ; 50
Ex1Array2 sdword 10                         ; 10
Ex1Array3 sdword 10,-20,30,50,40,-2,85      ; 85

.code
main proc
    invoke FindLargest, ADDR Ex1Array, LENGTHOF Ex1Array
    invoke FindLargest, ADDR Ex1Array, LENGTHOF Ex1Array
    invoke FindLargest, ADDR Ex1Array2, LENGTHOF Ex1Array2
    invoke FindLargest, ADDR Ex1Array3, LENGTHOF Ex1Array3

    invoke ExitProcess,0
main endp

FindLargest proc,
    aPtr:PTR SDWORD, arraySize:DWORD
    
    push esi
    push ecx
    mov  eax,80000000h       ; smallest possible signed integer
    mov  esi,aPtr
    mov  ecx,arraySize

L1: cmp  [esi],eax       ; get current value
    jng  L2              ; larger than max
    mov  eax,[esi]       ; update max value

L2: add  esi,4
    loop L1
    
    pop ecx
    pop esi
    ret
FindLargest endp

end main
