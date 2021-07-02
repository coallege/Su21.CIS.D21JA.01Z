class BitField {
   constructor (size, bits = 0) {
      this.size = size;
      this.mask = 2 ** size - 1;
      if (bits < 0) {
         throw TypeError("bits is not uint!");
      }
      this.bits = bits & this.mask;
   }

   not() {
      return new BitField(this.size, ~this.bits & this.mask);
   }

   add(val) {
      if (val < 0) {
         throw TypeError("val is not uint!");
      }
      return new BitField(this.size, this.bits + val);
   }

   toString(radix = 2) {
      return this.bits.toString(radix);
   }
}

/** @type {(size: number) => (int: number) => BitField} */
const u = size => int => new BitField(size, int);

/** @type {(size: number) => (int: number) => BitField} */
const i = size => int => {
   if (int < 0) {
      return new BitField(size, -int).not().add(1);
   } else {
      return new BitField(size, int);
   }
};

const u8  = u(8);
const u16 = u(16);

const i8  = i(8);
const i16 = i(16);

const char  = i8;
const uchar = u8;

module.exports = {
   u8, u16,
   i8, i16,
   char, uchar,
};
