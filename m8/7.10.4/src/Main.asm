; Write a procedure that performs simple encryption by rotating each plaintext
; byte a varyingnumber of positions in different directions. For example, in the
; following array that representsthe encryption key, a negative value indicates
; a rotation to the left and a positive value indicatesa rotation to the right.
; The integer in each position indicates the magnitude of the rotation:
;
; key byte -2, 4, 1, 0, -3, 5, 2, -4, -4
;
; Your procedure should loop through a plaintext message and align the key to
; the first 10 bytes ofthe message. Rotate each plaintext byte by the amount
; indicated by its matching key array value.Then, align the key to the next 10
; bytes of the message and repeat the process. Write a programthat tests your
; encryption procedure by calling it twice, with different data sets.
.386
.model flat, stdcall

.data
   key byte -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
   test1 byte "I like pancakes!"
   test2 byte "My secret: suffering."

.code
   ; char *str in eax
   ; char *end in ebx
   Encrypt proc
      xor esi, esi ; key index
   top:
      mov dl, [key + esi]
      cmp dl, 0
      jl negative
   positive:
      add [eax], dl
      jmp inc_idx
   negative:
      neg dl
      sub [eax], dl
   inc_idx:
      inc eax
      inc esi
      cmp esi, lengthof key
      jne see_if_done
      xor esi, esi
   see_if_done:
      cmp eax, ebx
      jne top
      ret
   Encrypt endp
main:
   mov eax, offset test1
   mov ebx, offset test1
   add ebx, lengthof test1
   call Encrypt

   mov eax, offset test2
   mov ebx, offset test2
   add ebx, lengthof test2
   call Encrypt

   xor eax, eax
   ret
end main
