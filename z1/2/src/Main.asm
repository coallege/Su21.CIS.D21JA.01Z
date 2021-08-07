.386
.model flat, stdcall

.data
   targetStr byte "Kamran", 20 dup(0)
   sourceStr byte " Eftekhari", 0
.code
   main:
      mov eax, offset targetStr - 1
      mov ebx, offset sourceStr
   findEndOfTarget:
      inc eax
      cmp byte ptr [eax], 0
      jnz findEndOfTarget
   copyToTarget:
      mov cl, byte ptr [ebx]
      mov byte ptr [eax], cl
      inc eax
      inc ebx
      cmp cl, 0
      jnz copyToTarget
      ; done. exit the program
      xor eax, eax
      ret
end main
