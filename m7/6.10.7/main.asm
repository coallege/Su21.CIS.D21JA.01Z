.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main:
   mov  al,01101111b
   and  al,00101101b              ; a.
   mov  al,6Dh
   and  al,4Ah                    ; b.
   mov  al,00001111b
   or   al,61h                    ; c.
   mov  al,94h
   xor  al,37h                    ; d.
   xor eax, eax
   ret
end main
