#include <bitset>
#include <iostream>
#include <sstream>
#include <array>
using namespace std;

constexpr size_t word_size{24};
using word = bitset<word_size>;

inline word twos_complement(word val) {
   return word((~val).to_ullong() + 1);
}

inline word to_w(int val) {
   if (val < 0) {
      return twos_complement(word(-val));
   } else {
      return word(val);
   }
}

inline word uadd(word a, word b) {
   return word(a.to_ullong() + b.to_ullong());
}

inline word usub(word a, word b) {
   return word(a.to_ullong() + b.to_ullong());
}

inline word iadd(word a, word b) {
   return uadd(a, b);
}

inline word isub(word a, word b) {
   return iadd(a, twos_complement(b));
}

inline string mem(word a) {
   ostringstream oss;
   oss << a;
   return oss.str();
}

constexpr auto digits = []{
   array<char, 10 + 26> a{};

   size_t i{};
   for (char c{'0'}; c <= '9'; ++c, ++i) {
      a[i] = c;
   }

   for (char c{'a'}; c <= 'z'; ++c, ++i) {
      a[i] = c;
   }

   return a;
}();

constexpr size_t uchars_needed(size_t max, size_t radix) {
   size_t at{1};
   size_t chars_needed{0};
   while (at < max) {
      at *= radix;
      chars_needed++;
   }
   return chars_needed;
}

constexpr size_t uword_max{(1 << word_size) - 1};

inline string ustr(word a, size_t radix) {
   if (radix < 2 || radix > sizeof(digits)) {
      return {};
   }

   size_t i{uchars_needed(uword_max, radix)};

   size_t rest{a.to_ullong()};
   char *chars = new char[i + 1];
   chars[i] = '\0';
   while (i --> 0) {
      // starts on second to last index
      chars[i] = digits[rest % radix];
      rest /= radix;
   }

   ostringstream oss;
   oss
      << 'i'
      << word_size
      << ':'
      << radix
      << '{'
      << chars
      << '}';

   delete[] chars;

   return oss.str();
}

constexpr size_t iword_max{(1 << (word_size - 1)) - 1};
constexpr size_t iword_min{1 << (word_size - 1)}; // sorta lol

inline string istr(word a, size_t radix) {
   if (radix < 2 || radix > sizeof(digits)) {
      return {};
   }

   size_t sign = a[word_size - 1];
}

int main() {
   word fourty_two = to_w(-42);
   cout << ustr(fourty_two, 10) << '\n';
}
