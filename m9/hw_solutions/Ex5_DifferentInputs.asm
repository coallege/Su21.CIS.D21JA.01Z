; Chapter 8, Exercise 5: Different Inputs

COMMENT !
Write a procedure named DifferentInputs that returns EAX = 1 if the values of its three input
parameters are all different; otherwise, return with EAX = 0. Use the PROC directive with a
parameter list when declaring the procedure. Create a PROTO declaration for your procedure,
and call it five times from a test program that passes different inputs.
!

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
DifferentInputs proto v1:dword, v2:dword, v3:dword

.data

.code
main proc

    invoke DifferentInputs,2,2,2

    invoke ExitProcess,0
main endp

DifferentInputs proc,
    v1:dword, v2:dword, v3:dword
    
    mov  eax,1
    mov  v1,eax
    cmp  v2,eax     ; v1 = v2?
    je   L2
    cmp  v3,eax     ; v1 = v3?
    je   L2
    jmp  exit       ; return true

L2: mov  eax,0      ; return false
exit:
    ret
DifferentInputs endp

end main