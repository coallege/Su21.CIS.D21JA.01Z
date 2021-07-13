; 2. Symbolic Integer Constants
; Write a program that defines symbolic constants for all seven days of the
; week. Create an array variable that uses the symbols as initializers.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

monday    = 1
tuesday   = 2
wednesday = 3
thursday  = 4
friday    = 5
saturday  = 6
sunday    = 7

.data
   days_of_week byte monday, tuesday, wednesday, thursday, friday, saturday, sunday

   monday_s    byte "monday"   , 0
   tuesday_s   byte "tuesday"  , 0
   wednesday_s byte "wednesday", 0
   thursday_s  byte "thursday" , 0
   friday_s    byte "friday"   , 0
   saturday_s  byte "saturday" , 0
   sunday_s    byte "sunday"   , 0

   names_of_week dword    \
      offset monday_s,    \
      offset tuesday_s,   \
      offset wednesday_s, \
      offset thursday_s,  \
      offset friday_s,    \
      offset saturday_s,  \
      offset sunday_s

.code
main:
   mov ecx, 0
   my_loop:
      xor eax,eax
      mov al, [days_of_week + ecx]
      call WriteInt
      mov al, ' '
      call WriteChar
      mov edx, [names_of_week + ecx * 4]
      call WriteString
      mov al, 10
      call WriteChar
      inc ecx
      cmp ecx, 7
   jl my_loop

   invoke ExitProcess, 0
end main
