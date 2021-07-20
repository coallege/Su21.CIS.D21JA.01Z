; Copying a Word Array to a DoubleWord array
; Write a program that uses a loop to copy all the elements from an unsigned
; Word (16-bit) array into an unsigned doubleword (32-bit) array.

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
   movzx dword_ary[esi * 4], ax
   test esi, esi
   jz top

end main

