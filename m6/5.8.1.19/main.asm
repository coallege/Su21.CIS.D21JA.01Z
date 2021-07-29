; Which statement is true about what will happen when the example code runs?
; a. EDX will equal 40 on line 6
; b. The program will halt with a runtime error on Line 13
; c. EDX will equal 0 on line 6
; d. The program will halt with a runtime error on Line 11
.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main PROC ; 1
   mov edx, 0 ; 2
   mov eax, 40 ; 3
   push eax ; 4
   call Ex5Sub ; 5
   INVOKE ExitProcess, 0 ; 6
main ENDP ; 7
; 8
Ex5Sub PROC ; 9
   pop eax ; 10
   pop edx ; 11
   push eax ; 12
   ret ; 13
Ex5Sub ENDP ; 14
end main
