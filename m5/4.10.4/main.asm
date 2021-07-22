; Copying a Word Array to a DoubleWord array
; Write a program that uses a loop to copy all the elements from an unsigned
; Word (16-bit) array into an unsigned doubleword (32-bit) array.
.386
.model flat, stdcall

ExitProcess proto, code: dword

.data
   word_ary word 0, 1, 2

.data?
   dword_ary dword 3 dup(?)

.code
main:
   mov esi, lengthof word_ary
top:
   dec esi
   mov ax, word ptr word_ary[esi * 2]
   movzx ebx, ax
   mov dword_ary[esi * 4], ebx
   test esi, esi
   jnz top
   invoke ExitProcess, 0
end main
