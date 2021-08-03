public main
.data
   dividend_hi  QWORD 00000108h
   dividend_lo  QWORD 33300020h
   divisor      QWORD 00000100h

.code
   main:
      mov  rdx,dividend_hi
      mov  rax,dividend_lo
      div  divisor
      nop
      xor eax, eax
      ret
end
