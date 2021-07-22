include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

.data
   myBytes  byte 10h, 20h, 30h, 40h
   myWords  word 3 dup(?), 2000h
   myString byte "ABCDE"
   $answer_str byte ?, ": ", 0
   
.code
answer proc which: byte, val: dword
   mov al, which
   mov [$answer_str], al
   mov edx, offset $answer_str
   call WriteString
   mov eax, val
   call WriteHex
   mov al, 10
   call WriteChar
   ret
answer endp
main:
   invoke answer, 'a', type myBytes
   invoke answer, 'b', lengthof myBytes
   invoke answer, 'c', sizeof myBytes
   invoke answer, 'd', type myWords
   invoke answer, 'e', lengthof myWords
   invoke answer, 'f', sizeof myWords
   invoke answer, 'g', sizeof myString
   exit
end main
