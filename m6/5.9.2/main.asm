; Suppose you are given three data items that indicate a starting index in a
; list, an array of characters, and an array of link index. You are to write a
; program that traverses the links and locates thecharacters in their correct
; sequence. For each character you locate, copy it to a new array. Sup-pose you
; used the following sample data, and assumed the arrays use zero-based indexes:
; start = 1
; chars: H A C E B D F G
; links: 0 4 5 6 2 3 7 0
; Then the values copied (in order) to the output array would be A,B,C,D,E,F,G,H.
; Declare the character array as type BYTE, and to make the problem more
; interesting, declare the links array type DWORD.
.386
.model flat, stdcall

ExitProcess proto, code: dword

.data
   start = 1
   chars byte "H", "A", "C", "E", "B", "D", "F", "G"
   links dword 0, 4, 5, 6, 2, 3, 7, 0
   output byte lengthof chars dup(?)

.code
main:
   xor eax, eax   ; output index  (i)
   xor esi, esi   ; last index    (s)
   mov edi, start ; current index (d)
l1:
   cmp esi, edi
   je done
   ; output[i] = chars[d]
   ; i++
   ; esi = edi
   ; edi = links[edi]
   mov cl, chars[edi]
   mov output[eax], cl
   inc eax
   mov esi, edi
   mov edi, links[edi * 4]
   jmp l1
done:
   xor eax, eax
   ret
end main
