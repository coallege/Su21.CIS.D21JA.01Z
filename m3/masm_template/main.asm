.386
.model flat, stdcall

ExitProcess proto, code: dword

.code
main:
   ; code here
   invoke ExitProcess, 0
end main
