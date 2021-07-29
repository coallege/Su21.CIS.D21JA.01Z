; Write a program that clears the screen, locates the cursor near the middle of
; the screen, prompts the user for two integers, adds the integers, and displays
; their sum.
;
; Use the solution program from the preceding exercise as a starting point. Let
; this new program repeat the same steps three times, using a loop. Clear the
; screen after each loop iteration.
include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

.data
   sPrompt byte "Enter an integer:", 0
   promptIntA dword ?
   promptIntB dword ?
   sResult byte "Sum is ", 0

.code
   CenterScreen:
      xor eax, eax
      xor edx, edx
      call GetMaxXY
      mov dh, 30 ; MaxXY y doesn't work
      sar dl, 1
      sar dh, 1
      call Gotoxy
      ret
   prompt:
      call Clrscr
      call CenterScreen
      mov edx, offset sPrompt
      call WriteString
      call ReadInt
      mov promptIntA, eax

      mov edx, offset sPrompt
      call WriteString
      call ReadInt

      add eax, promptIntA
      mov edx, offset sResult
      call WriteString
      call WriteInt
      ret
   main:
      mov ecx, 3
      l1:
      call prompt
      loop l1
      xor eax, eax
      ret
end main
