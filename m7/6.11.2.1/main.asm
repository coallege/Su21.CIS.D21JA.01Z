; Create a procedure that fills an array of doublewords with N random integers,
; making sure the values fall within the range j...k, inclusive. When calling
; the procedure, pass a pointer to thearray that will hold the data, pass N, and
; pass the values of j and k. Preserve all register valuesbetween calls to the
; procedure. Write a test program that calls the procedure twice, using
; different values for j and k. Verify your results using a debugger.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.data
   ary1 dword 7 dup(?)
   ary2 dword 9 dup(?)

.code
RandomArrayFill proc ary: dword, sz: dword, j: dword, k: dword
   pushad
   call Randomize
   mov edx, ary
   mov esi, sz ; index
   sub ecx, j
   mov ecx, k
L1:
   dec esi
   mov eax, ecx
   call RandomRange
   add eax, j
   mov [edx + esi * 4], eax
   test esi, esi
   jnz L1
   popad
   ret
RandomArrayFill endp
main:
   invoke RandomArrayFill, offset ary1, lengthof ary1, 50, 90
   invoke RandomArrayFill, offset ary2, lengthof ary2, 1, 4
   invoke ExitProcess, 0
end main
