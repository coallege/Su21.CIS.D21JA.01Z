#include <bitset>
#include <iostream>
#include <sstream>
#include <array>
#include <string>
using namespace std;

constexpr size_t word_size{24};
using word = bitset<word_size>;

struct wov {
   word word;
   bool overflow;
};

inline wov make(size_t val) {
   if (val >> word_size) {
      return {word{val}, true};
   } else {
      return {word{val}, false};
   }
}

inline wov twos_complement(word val) {
   return make((~val).to_ullong() + 1);
}

inline word to_w(long long val) {
   if (val < 0) {
      return twos_complement(word(-val)).word;
   } else {
      return word(val);
   }
}

inline wov uadd(word a, word b) {
   return make(a.to_ullong() + b.to_ullong());
}

inline wov usub(word a, word b) {
   size_t A{a.to_ullong()};
   size_t B{b.to_ullong()};
   constexpr size_t wrap_around{1 << word_size};
   if (A < B) {
      return {word(wrap_around - B + A), true};
   } else {
      return {word(A - B), false};
   }
}

inline bool is_negative(word a) {
   return a[word_size - 1];
}

inline wov iadd(word a, word b) {
   word word_c = uadd(a, b).word;
   // if a and b have the same signs
   if (is_negative(a) == is_negative(b)) {
      // then c should also have the same sign
      if (is_negative(a) == is_negative(word_c)) {
         return {word_c, false};
      } else {
         return {word_c, true};
      }
   }
   return {word_c, false};
}

inline wov isub(word a, word b) {
   auto [word_b, ov_b] = twos_complement(b);
   auto [word_c, ov_c] = iadd(a, word_b);
   return {word_c, ov_b || ov_c};
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

inline string ustr(word a, size_t radix) {
   if (radix < 2 || radix > sizeof(digits)) {
      return {};
   }

   constexpr size_t uword_max{(1 << word_size) - 1};
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
      << 'u'
      << word_size
      << ':'
      << radix
      << '{'
      << chars
      << '}';

   delete[] chars;

   return oss.str();
}

// not sure if these are actually needed
// can someone else do the math for me
constexpr size_t iword_max{(1 << (word_size - 1)) - 1};
constexpr size_t iword_min{1 << (word_size - 1)}; // sorta lol

inline string istr(word a, size_t radix) {
   if (radix < 2 || radix > sizeof(digits)) {
      return {};
   }

   char *chars;
   if (is_negative(a)) {
      size_t rest = (~a).to_ullong() + 1;

      size_t i = 1 + uchars_needed(iword_min, radix);
      chars = {new char[i + 1]};
      chars[i] = '\0';
      chars[0] = '-';

      while (i --> 1) {
         chars[i] = digits[rest % radix];
         rest /= radix;
      }
   } else {
      size_t rest = a.to_ullong();

      size_t i = uchars_needed(iword_max, radix);
      chars = new char[i + 1];
      chars[i] = '\0';

      while (i --> 0) {
         chars[i] = digits[rest % radix];
         rest /= radix;
      }
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

char const *ov(bool ov) {
   if (ov) {
      return " (Overflow)\n";
   } else {
      return " (No Overflow)\n";
   }
}

int main() {
   wov p1a{uadd(to_w(0x348263), to_w(0x73c698))};
   wov p1b{usub(to_w(0x98ea7f), to_w(0x89ff63))};
   wov p1c{iadd(to_w(0x396fe2), to_w(0x538aaa))};
   wov p1d{isub(to_w(0xa689be), to_w(0xb8fde3))};
   cout
      << "1a = " << ustr(p1a.word, 16) << ov(p1a.overflow)
      << "1b = " << ustr(p1b.word, 16) << ov(p1b.overflow)
      << "1c = " << ustr(p1c.word, 16) << ov(p1c.overflow)
      << "   = " << istr(p1c.word, 16) << '\n'
      << "1d = " << ustr(p1d.word, 16) << ov(p1d.overflow)
      << "   = " << istr(p1d.word, 16) << '\n';
}
