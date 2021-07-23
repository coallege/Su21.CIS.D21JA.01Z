.386
.model flat, stdcall

ExitProcess proto, code: dword

.data
var1 sbyte -20, -1, 1, 29
var2 word  0FE00h, 0C900h, 9100h, 2F00h
var3 sword -16, -27
var4 dword -15, 14, 13, 12, 11

.code
main:
   ; use the debugger
   mov edx, var4
   nop ; a
   movzx eax, [var2 + 6]
   nop ; b
   mov edx, [var4 + 12]
   nop ; c
   movsx edx, var1
   nop ; d
   invoke ExitProcess, 0
end main
