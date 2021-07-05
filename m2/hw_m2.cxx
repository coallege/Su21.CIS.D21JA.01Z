#include <bitset>
#include <iostream>
#include "../include/mem.hxx"

int main() {
   system("node hw_m2 3");
   system("node hw_m2 6");
   system("node hw_m2 8");
   system("node hw_m2 9");
   cout
      << "11.\n"
      << "   a. " << mem<16>::from_signed(-0x024).ustr(16) << '\n'
      << "   b. " << mem<16>::from_signed(-0x331).ustr(16) << '\n';
   cout
      << "14.\n"
      << "   a. " << mem<16>::from_signed(0x4CD2).istr(10) << '\n'
      << "   b. " << mem<16>::from_signed(0x8230).istr(10) << '\n';
   cout
      << "17.\n"
      << "   a. " << mem<8>::from_signed(- 5).bits() << '\n'
      << "   b. " << mem<8>::from_signed(-42).bits() << '\n'
      << "   c. " << mem<8>::from_signed(-16).bits() << '\n';
   system("node hw_m2 19");
   system("node hw_m2 20");
}
