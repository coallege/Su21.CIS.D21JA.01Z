option casemap: none

include <SmallWin.inc>
includelib <kernel32.lib>

nullptr = 0

.data
output byte "Hello, kernel32!"
output_size = $ - output

.data?
h_stdout HANDLE ?
bytes_written dword ?

.code
main:
   invoke GetStdHandle, STD_OUTPUT_HANDLE
   mov h_stdout, eax
   invoke WriteConsole    \
   , h_stdout             \
   , offset output        \
   , output_size          \
   , offset bytes_written \
   , nullptr              \

   invoke ExitProcess, 0
end main
