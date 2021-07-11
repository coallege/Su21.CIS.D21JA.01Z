#pragma once
#include <bitset>
#include <array>
#include <sstream>
using namespace std;

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

constexpr size_t chars_needed(size_t const max, size_t const radix) {
   size_t at{1};
   size_t chars_needed{0};
   while (at < max) {
      at *= radix;
      chars_needed++;
   }
   return chars_needed;
}

template <size_t size>
struct mem: bitset<size> {
   // this should be a monad, scrunge
   struct mem_ov {
      mem mem;
      bool ov;
   };

   static inline mem_ov from(size_t const v) {
      return {.mem{v}, .ov{v >> size ? true : false}};
   }

   static inline mem from_signed(long long const v) {
      if (v < 0) {
         return mem{-v}.complement().mem.operator+(1).mem;
      } else {
         return mem{v};
      }
   }

   inline mem_ov operator+(size_t const v) const {
      return mem::from(this->to_ullong() + v);
   }

   inline mem_ov complement() const {
      return mem::from(this->operator~().to_ullong() + 1);
   }

   inline mem_ov uadd(mem const b) const {
      return mem::from(this->to_ullong() + b.to_ullong());
   }

   inline mem_ov usub(mem const b) const {
      size_t const A{this->to_ullong()};
      size_t const B{b.to_ullong()};
      constexpr size_t wrap_around{1 << size};
      if (A < B) {
         return {.mem{wrap_around - B + A}, .ov{true}};
      } else {
         return {.mem{A - B}, .ov{false}};
      }
   }

   inline bool is_negative() const {
      // s u f f e r .
      return this->operator[](size - 1);
   }

   inline bool same_sign_as(mem const b) {
      return this->is_negative() == b.is_negative();
   }

   inline mem_ov iadd(mem const b) const {
      mem const c{this->to_ullong() + b.to_ullong()};
      return {
         .mem{c},
         .ov{this->same_sign_as(b) and not this->same_sign_as(c)}
      };
   }

   inline mem_ov isub(mem const b) const {
      auto const [c, ov_c]{b.complement()};
      auto const [d, ov_d]{this->iadd(c)};
      return {.mem{d}, .ov{ov_c or ov_d}};
   }

   inline string bits() const {
      return "0b" + this->to_string();
   }

   inline string ustr(size_t const radix) const {
      if (radix < 2 || radix > sizeof(digits)) {
         __builtin_trap();
      }

      constexpr size_t uword_max{(1 << size) - 1};
      size_t i{chars_needed(uword_max, radix)};

      size_t rest{this->to_ullong()};
      char *chars = new char[i + 1];
      chars[i] = '\0';

      while (i --> 0) {
         chars[i] = digits[rest % radix];
         rest /= radix;
      }

      ostringstream oss;
      oss
         << 'u'
         << size
         << ':'
         << radix
         << '{'
         << chars
         << '}';

      delete[] chars;

      return oss.str();
   }

   inline string istr(size_t const radix) const {
      if (radix < 2 || radix > sizeof(digits)) {
         __builtin_trap();
      }

      char *chars;
      if (this->is_negative()) {
         // the minimum longest number
         constexpr size_t iword_min{1 << (size - 1)};
         size_t i{sizeof('-') + chars_needed(iword_min, radix)};

         size_t rest{this->complement().mem.to_ullong()};

         chars = {new char[i + 1]};
         chars[i] = '\0';
         chars[0] = '-';

         while (i --> 1) {
            chars[i] = digits[rest % radix];
            rest /= radix;
         }
      } else {
         constexpr size_t iword_max{(1 << (size - 1)) - 1};
         size_t i{chars_needed(iword_max, radix)};

         size_t rest{this->to_ullong()};

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
         << size
         << ':'
         << radix
         << '{'
         << chars
         << '}';

      delete[] chars;

      return oss.str();
   }
};

auto q = mem<16>::from_signed(-1);
