; Exchanging Pairs of Array Values
; Write a program with a loop and indexed addressing that exchanges every pair
; of values in an array with an even number of elements. Therefore, item i will
; exchange with item i+1, and item i+2 will exchange with item i+3, and so on.
.386
.model flat, stdcall
.data
   array byte 0, 1, 2, 3, 4, 5

.code
main:
   xor esi, esi
top:
   mov al, array[esi]
   xchg al, array[esi + 1]
   mov array[esi], al

   add esi, 2
   cmp esi, lengthof array
   jl top
end main
