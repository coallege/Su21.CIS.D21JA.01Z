; Create a procedure named Extended_Sub that subtracts two binary integers of
; arbitrary size. The storage size of the two integers must be the same, and
; their size must be a multiple of 32bits. Write a test program that passes
; several pairs of integers, each at least 10 bytes long.
.386
.model flat, stdcall

.data
   ; 3 * sizeof(dword) = 12 bytes
   int_a dword 1234h, 5678h, 9012h   ; 123456789012h
   int_b dword 0123h, 4567h, 8900h   ; 012345678900h
   res   dword lengthof int_a dup(?)

.code
   ; dword *a, dword *b, dword *result, dword numberOfDwords <top of stack here>
   ; computes a - b and stores the result in result
   Extended_Sub proc
      pop edi ; return pointer
      pop ecx
      pop esi
      pop ebx
      pop eax
      push edi ; put it back
      clc
   l1:
      dec ecx
      mov edx, [eax + ecx * 4]
      mov [esi + ecx * 4], edx ; result[ecx] = a[ecx]
      mov edx, [ebx + ecx * 4]
      sbb [esi + ecx * 4], edx ; result[ecx] -= b[ecx]

      test ecx, ecx
      jnz l1
      ret
   Extended_Sub endp
   main:
      push offset int_a
      push offset int_b
      push offset res
      mov eax, lengthof int_a
      push eax
      call Extended_Sub
      xor eax, eax
      ret
end main
