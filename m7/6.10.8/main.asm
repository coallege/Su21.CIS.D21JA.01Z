.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main:
   xor eax, eax
   mov  al,7Ah
   not  al      ; a
   nop
   mov  al,3Dh
   and  al,74h  ; b
   nop
   mov  al,9Bh
   or   al,35h  ; c
   nop
   mov  al,72h
   xor  al,0DCh ; d
   nop
   invoke ExitProcess, 0
end main
