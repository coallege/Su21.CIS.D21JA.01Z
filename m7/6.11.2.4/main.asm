include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

TRUE = 1
FALSE = 0

.data
   gradeAverage  WORD ?
   credits       WORD ?
   OkToRegister  BYTE ?

   promptGradeAv byte "What is your Grade Average: ", 0
   promptCredits byte "How many credits do you have: ", 0
   creditsTooHi  byte "Credits must be in between 1 and 30", 0
   canRegister   byte "The student can register!", 10, 0
   cantRegister  byte "The student cannot register", 10, 0

.code
main:
   mov edx, offset promptGradeAv
   call WriteString
   call ReadInt
   mov gradeAverage, ax

   mov edx, offset promptCredits
   call WriteString
   call ReadInt
   cmp credits, 30
   jg $creditsTooHigh
   cmp credits, 0
   jl $creditsTooHigh
   mov credits, ax
   jmp $next
$creditsTooHigh:
   mov edx, offset creditsTooHi
   call WriteString
   invoke ExitProcess, 0

$next:
   mov  byte ptr OkToRegister,FALSE
   cmp  word ptr gradeAverage,350
   jbe  L0
   mov  byte ptr OkToRegister,TRUE
   jmp  L2
L0:
   cmp  word ptr gradeAverage,250
   jbe  L1
   cmp  word ptr credits,16
   ja   L1
   mov  byte ptr OkToRegister,TRUE
   jmp  L2
L1:
   cmp  word ptr credits,12
   ja   L2
   mov  byte ptr OkToRegister,TRUE
L2:
   mov al, OkToRegister
   cmp al, al
   jz $else
      mov edx, offset canRegister
      jmp $fi
   $else:
      mov edx, offset cantRegister
   $fi:
   call WriteString
   invoke ExitProcess, 0
end main
