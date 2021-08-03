; what is the output of this nonsense
.386
.model flat, stdcall

.data
   val1   QWORD 20403004362047A1h
   val2   QWORD 055210304A2630B2h
   result QWORD 0

.code
main:
   mov  ecx,8                 ; loop counter
   mov  esi,offset val1       ; set index to start
   mov  edi,offset val2
   clc                        ; clear Carry flag
top:
   mov  al,BYTE PTR[esi]      ; get first number
   sbb  al,BYTE PTR[edi]      ; subtract second
   mov  BYTE PTR[esi],al      ; store the result
   inc  esi
   inc  edi
   loop top
   nop
   xor eax, eax
   ret
end main
