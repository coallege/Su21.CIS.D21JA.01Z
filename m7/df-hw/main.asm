include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.data
   signed_str byte "signed -42 > 26", 0
   unsigned_str byte "unsigned 0xffffffd6 > 0x0000001a", 0

.code
signed:
   mov edx, offset signed_str
   call WriteString
   invoke ExitProcess, 0

unsigned:
   mov edx, offset unsigned_str
   call WriteString
   invoke ExitProcess, 0

main:
   mov eax, -42 ; 0xffffffd6
   cmp eax, 26  ; 0x0000001a

   jg signed    ; signed comparison. -42 > 26. jump not taken
   ja unsigned  ; unsigned comparison. 0xffffffd6 > 0x0000001a. jump taken

   invoke ExitProcess, 0
end main
