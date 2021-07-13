; 4. Symbolic Text Constants
; Write a program that defines symbolic names for several string literals
; (characters between quotes). Use each symbolic name in a variable definition.

include <Irvine32.inc>
includelib <Irvine32.lib>
includelib <Kernel32.lib>
includelib <User32.lib>

what_is_cat_name textequ <"What is your cat's name?">
say_hello        textequ <"Say hello to ">
for_me           textequ <" for me!!"> ; cursed !! produces 1 exclamation point
lf = 10

.data
   prompt  byte what_is_cat_name, lf, "> ", 0
   output0 byte say_hello, 0
   output1 byte for_me, lf, 0

.data?
   catname_maxlen = 63
   catname byte catname_maxlen + 1 dup(?)

.code
main:
   mov edx, offset prompt
   call WriteString

   mov ecx, catname_maxlen
   mov edx, offset catname
   call ReadString

   mov edx, offset output0
   call WriteString

   mov edx, offset catname
   call WriteString

   mov edx, offset output1
   call WriteString

   invoke ExitProcess, 0
end main
