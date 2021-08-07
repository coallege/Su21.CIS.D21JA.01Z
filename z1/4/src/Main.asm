.386
.model flat, stdcall

.data
   ary dword 1,2,3,4,5,6,7,8,9,10,11,12,13,14
   sum dword ?

.code
main:
   xor eax, eax ; a = 0
   mov esi, 3 ; i = 0
top:
   cmp esi, lengthof ary
   ja done
   add eax, [ary + esi * 4]
   add esi, 4
   jmp top
done:
   mov sum, eax
   xor eax, eax
   ret
end main
