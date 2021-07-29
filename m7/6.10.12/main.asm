; What will be the final value in EDX after this code executes?
.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main:
   mov  edx,1
   mov  eax,7FFFh
   cmp  eax,8000h
   jl   L1
   mov  edx,0
   L1:
   invoke ExitProcess, 0
end main
