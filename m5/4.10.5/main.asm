; Fibonacci Numbers
; Write a program that uses a loop to calculate the first seven values of the
; Fibonacci number sequence, described by the following formula: Fib(1) = 1,
; Fib(2) = 1, Fib(n) = Fib(n – 1) + Fib(n – 2).
.386
.model flat, stdcall
ExitProcess proto, code: dword
.code
main:
   xor esi, esi ; i = 0

   xor eax, eax ; a = 0
   mov ebx, 1   ; b = 1

luup:
   mov ecx, eax ; c = a
   add ecx, ebx ; c += b
   inc esi      ; i++
   ; print out fib number esi
   mov eax, ebx ; a = b
   mov ebx, ecx ; b = c
   cmp esi, 7
   jl luup

   invoke ExitProcess, 0
end main
