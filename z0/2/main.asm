.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main:
   ; as a sample
   ; to store 1234567898765432h, ebx will have msb and eax will have lsb
   mov ebx, 12345678h ; msb
   mov eax, 98765432h ; lsb

   ; same with the edx,ecx pair
   mov edx, 12345678h
   mov ecx, 98765432h

   ; first add lsb
   ; we are going to store the result of the addition in the edx, ecx pair
   add ecx, eax ; ecx += eax

   lahf
   and ah, 1 ; get the carry flag only
   movzx eax, ah ; sign extend it to match operand sizes
   add edx, esi ; add the carry flag

   ; add the msb
   add edx, ebx

   invoke ExitProcess, 0
end main
