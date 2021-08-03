comment @
.386
.model flat, stdcall
@

comment @
include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>
@

.code
main:
   xor eax, eax
   ret
end main
