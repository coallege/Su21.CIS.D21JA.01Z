.386
.model flat, stdcall

.data
   str1 byte "Excellent time too listen to music", 0
.code
   main:
      mov ah, 'o'
      xor esi, esi
   top:
      cmp ah, str1[esi]
      jne bottom
   match1:
      cmp ah, str1[esi + 1]
      jne bottom
   move:
      mov edi, esi
   moveloop:
      inc edi
      cmp edi, lengthof str1
      je  bottom
      mov al, str1[edi + 1]
      mov str1[edi], al
      jmp moveloop
   bottom:
      inc esi
      cmp esi, lengthof str1 - 1
      jne top
      jmp $end
   $end:
      ; exit program
      xor eax, eax
      ret
end main
