const p = Object.create(null);

p[3] = {
   a: "0b" + (0b10101111 + 0b1101101).toString(2),
   b: "0b" + (0b10010111 + 0b1111111).toString(2),
   c: "0b" + (0b01110101 + 0b1010110).toString(2),
};

const minBinaryBits = n => n.toString(2).length

p[6] = {
   a: minBinaryBits(4095),
   b: minBinaryBits(65534),
   c: minBinaryBits(42319),
};

p[8] = {
   a: "0b" + 0x0126F9D4.toString(2),
   b: "0b" + 0x6ACDFA95.toString(2),
   c: "0b" + 0xF69BDC2A.toString(2),
};

p[9] = {
   a: 0x3A,
   b: 0x1BF,
   c: 0x1001,
};

p[19] = {
   a: "0x" + (0x6B4 + 0x3FE).toString(16),
   b: "0x" + (0xA49 + 0x6BD).toString(16),
};

p[20] = {
   a: "0x" + (0x7C4 + 0x3BE).toString(16),
   b: "0x" + (0xB69 + 0x7AD).toString(16),
};

const [node, script, n] = process.argv;

console.log(`${n}.`);
for (const [k, v] of Object.entries(p[n])) {
   console.log(`   ${k}. ${v}`);
}
