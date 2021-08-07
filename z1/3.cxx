// into godbolt with clang++ -m32
extern "C" void branch1() noexcept;
extern "C" void branch2() noexcept;
void program(int a, int b) noexcept {
   if ((a <= 15 && a >= 2) && (b <= 2 || b >= 14)) {
      branch1();
   } else {
      branch2();
   }
}
