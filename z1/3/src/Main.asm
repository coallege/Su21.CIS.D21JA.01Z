.386
.model flat, stdcall

.data
   ; sdword because int!
   a sdword 2
   b sdword 1

.code
; (a<=15 && a>=2) && (b<=2 || b>=14)
main:
   cmp a, 15
   jg $else  ; a <= 15 inverse a > 15
   cmp a, 2  ; a >= 2  inverse a < 2
   jl $else
   ; to get here, both a<=15 and a>=2 must be true
   cmp b, 2
   jle $then ; b <= 2
   cmp b, 14
   jge $then ; b >= 14
   ; both of b <= 2 and b >= 14 was false
   jmp $else
$then:
   mov eax, a
   sub eax, 4
   mov b, eax ; b = a - 4
   sub eax, 2
   mov a, eax ; a = b - 2
   jmp done
$else:
   mov eax, b
   sub eax, 2
   mov a, eax ; a = b - 2
   sub b, 5   ; b = b - 5
   jmp done
done:
   ; exit the program
   xor eax, eax
   ret
end main
