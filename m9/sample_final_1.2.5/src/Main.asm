.386
.model flat, stdcall

.code
main:
   mov al,0D4h
   ror al,3
   nop ; a.
   mov al,0D4h
   rol al,7
   nop ; b.
   stc
   mov al,0D4h
   rcl al,1
   nop ; c.
   stc
   mov al,0D4h
   rcr al,3
   nop ; d. 
   xor eax, eax
   ret
end main
