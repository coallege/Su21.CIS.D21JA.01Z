; 1. Integer Expression Calculation
; Using the AddTwo program from Section 3.2 as a reference, write a program that
; calculates the following expression, using registers:
; A = (A + B) − (C + D).
; Assign integer values to the EAX, EBX, ECX, and EDX registers.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.code
main:
   xor esi, esi
   xor edi, edi

   mov eax, 500 ; A = 500
   mov ebx, 829 ; B = 829
   mov ecx, 172 ; C = 172
   mov edx, 101 ; D = 101

   add eax, ebx ; A = (A + B)
   add ecx, edx ; C = (C + D)
   sub eax, ecx ; A = A - C

   call DumpRegs
   invoke ExitProcess, 0
end main
