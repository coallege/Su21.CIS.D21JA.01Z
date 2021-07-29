; Which statement is true about what will happen when the example code runs?
; a. EAX will equal 40 on line 6
; b. The program will halt with a runtime error on Line 6
; c. EAX will equal 30 on line 6
; d. The program will halt with a runtime error on Line 13
.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main PROC ; 1
   mov  eax, 30 ; 2
   push eax ; 3
   push 40 ; 4
   call Ex3Sub ; 5
   INVOKE ExitProcess, 0 ; 6
main ENDP ; 7
; 8
Ex3Sub PROC ; 9
   pusha ; 10
   mov eax,80 ; 11
   popa ; 12
   ret ; 13
Ex3Sub ENDP ; 14
end main
