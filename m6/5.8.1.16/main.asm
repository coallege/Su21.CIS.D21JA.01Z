; Which statement is true about what will happen when the example code runs?
; a. EAX will equal 10 on line 6
; b. The program will halt with a runtime error on Line 10
; c. EAX will equal 20 on line 6
; d. The program will halt with a runtime error on Line 11 
.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main PROC  ; 1
   push 10 ; 2
   push 20 ; 3
   call Ex2Sub ; 4
   pop eax ; 5
   INVOKE ExitProcess, 0 ; 6
main ENDP ; 7
; 8
Ex2Sub PROC ; 9
   ; you just popped the return address :scrunge:
   pop eax ; 10
   ret ; 11
Ex2Sub ENDP ; 12
end main
