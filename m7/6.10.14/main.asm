; What will be the final value in EDX after this code executes?
.386
.model flat, stdcall

.code
main:
   mov  edx,1
   mov  eax,7FFFh
   cmp  eax,0FFFF8000h
   jl   L2
   mov  edx,0
   L2:
   xor eax, eax
   ret
end main
