.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
SumArray proc ary: dword, j: dword, k: dword
   pushad
   xor eax, eax
   mov ebx, ary
   mov ecx, j
   mov edx, k
   cmp ecx, edx
top:
   je done
   add eax, ebx[ecx]
   inc ecx
   jmp top
done:
   popad
   ret
SumArray endp
main:
   ; code here
   invoke ExitProcess, 0
end main
