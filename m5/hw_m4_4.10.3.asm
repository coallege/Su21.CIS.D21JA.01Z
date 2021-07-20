; Summing the Gaps between Array Values
; Write a program with a loop and indexed addressing that calculates the sum of
; all the gaps between successive array elements. The array elements are
; doublewords, sequenced in nonde-creasing order. So, for example, the array
; {0, 2, 5, 9, 10} has gaps of 2, 3, 4, and 1, whose sum equals 10.
include <Irvine32.inc>
includelib <Irvine32.Lib>
includelib <Kernel32.Lib>
includelib <User32.Lib>

.data
   array dword 0, 2, 5, 9, 10

.code
main:
   xor eax, eax
   xor ebx, ebx

top:
   cmp ebx, lengthof array - 1
   je done

   add eax, dword ptr array[ebx * 4 + 4]
   sub eax, dword ptr array[ebx * 4 + 0]

   inc ebx
   jmp top

done:
   call WriteInt
   exit

end main
