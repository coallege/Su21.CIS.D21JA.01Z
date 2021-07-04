const {i8, i16} = require("./int");

const p = Object.create(null);

p[3] = {
   a: 0b10101111 + 0b1101101,
   b: 0b10010111 + 0b1111111,
   c: 0b01110101 + 0b1010110,
};

const minBinaryBits = n => n.toString(2).length

p[6] = {
   a: minBinaryBits(4095),
   b: minBinaryBits(65534),
   c: minBinaryBits(42319),
};

p[8] = {
   a: 0x0126F9D4.toString(2),
   b: 0x6ACDFA95.toString(2),
   c: 0xF69BDC2A.toString(2),
};

p[9] = {
   a: 0x3A,
   b: 0x1BF,
   c: 0x1001,
};

p[11] = {
   a: i16(-24).toString(16),
   b: i16(-331).toString(16),
}

p[14] = {
   a: i16(0x4CD2).toString(10),
   b: i16(0x8230).toString(10),
};

p[17] = {
   a: i8(-5),
   b: i8(-42),
   c: i8(-16),
};

p[19] = {
   a: 0x6B4 + 0x3FE,
   b: 0xA49 + 0x6BD,
};

p[20] = {
   a: 0x7C4 + 0x3BE,
   b: 0xB69 + 0x7AD,
};

for (const n of Object.keys(p)) {
   console.log(`${n}.`);
   for (const [k, v] of Object.entries(p[n])) {
      console.log(`   ${k} = ${v}`);
   }
}
