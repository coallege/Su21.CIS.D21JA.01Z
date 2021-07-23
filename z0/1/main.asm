.386
.model flat, stdcall

ExitProcess proto, code: dword

.data?
   buf byte 8 dup(?)

.code
main:
   mov eax, 12131415h
   mov edx, 12345678h

   mov dword ptr [buf + 0], edx
   mov dword ptr [buf + 4], eax

   mov ecx, 4 ; bottom counter
   mov esi, 4 ; top counter
L1:
   mov bl, [buf + esi]
   xchg bl, [buf + ecx - 1]
   mov [buf + esi], bl
   inc esi
   loop L1

   mov edx, dword ptr [buf + 0]
   mov eax, dword ptr [buf + 4]

   invoke ExitProcess, 0
end main
