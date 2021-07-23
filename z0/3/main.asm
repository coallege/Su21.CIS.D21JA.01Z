.386
.model flat, stdcall

ExitProcess proto, code: dword

.data
; example Array1, can be anything as long as it has a 19th index
Array1 dword 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, 1ch, 1dh, 1eh, 1fh, 1h, 1h, 1h, 1h, 1h, 1h
addAmount = 12h
elementsToAddTo dword 0, 3, 7, 11, 15, 19

.code
main:
   mov ecx, lengthof elementsToAddTo
L1:
   mov eax, [elementsToAddTo + ecx * 4 - 4]
   add Array1[eax * 4], addAmount
   loop L1
   invoke ExitProcess, 0
end main
