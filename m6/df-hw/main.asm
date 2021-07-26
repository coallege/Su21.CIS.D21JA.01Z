.386
.model flat, stdcall
ExitProcess proto, code: dword

.code
main proc
   mov ax, 1
   call blue
   mov bx, 2
   ret ; you need to add this
main endp

blue proc
   mov ax, 4
   mov bx, 4
   ret
blue endp

end main
