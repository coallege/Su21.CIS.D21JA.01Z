.386
.model flat, stdcall
option casemap: none ; because of case sensitivty, suffer

include <windows.inc>
include <kernel32.inc>
includelib <kernel32.lib>

.data
output byte "Hello, kernel32!"

.data?
h_stdout HANDLE ?
bytes_written dword ?

.code
main:
   invoke GetStdHandle, STD_OUTPUT_HANDLE
   mov h_stdout, eax
   invoke WriteConsole    \ ; death
   , h_stdout             \ ; hConsoleOutput
   , offset output        \ ; lpBuffer
   , 14                   \ ; nNumberOfCharsToWrite
   , offset bytes_written \ ; lpNumberOfCharsWritten
   , 0                    \ ; lpReserved

   invoke ExitProcess, 0
end main
