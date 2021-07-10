include <Irvine32.inc>
includelib <Irvine32.Lib>
; Irvine32.inc requires kernel32.dll and user32.dll :scringe:
includelib <Kernel32.Lib>
includelib <User32.Lib>

.data
   greeting byte "Hello, Irvine32!", 0

.code
   main proc
      mov edx, offset greeting
      call WriteString
      exit
   main endp
end
