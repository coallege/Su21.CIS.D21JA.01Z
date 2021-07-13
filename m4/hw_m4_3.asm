; 3. Data Definitions
; Write a program that contains a definition of each data type listed in Table
; 3-2 in Section 3.4. Initialize each variable to a value that is consistent
; with its data type.
includelib <Kernel32.lib>

.data
   _byte   byte    +99
   _sbyte  sbyte   -32d
   _word   word    +0FFFFh
   _sword  sword   -49h
   _dword  dword   $
   _sdword sdword  -0FFFFh
   _fword  fword   +0FFFFFFFFh
   ; cannot actually make an entire qword on IA-32
   _qword  qword   +0FFFFFFFFh
   _tbyte  tbyte   +012345678h
   _real4  real4   -4.6
   _real8  real8   +3.2E-260
   _real10 real10  +1.1E+12

.code
main:
   invoke ExitProcess, 0
end main
