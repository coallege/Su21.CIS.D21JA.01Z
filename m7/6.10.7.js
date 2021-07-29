var al;

var c = 'a'.codePointAt(0);
function pal() {
   console.log(`${String.fromCodePoint(c++)}. ${al.toString(2).padStart(8, '0')}b`);
}

al = 0b01101111
al &= 0b00101101
pal();

al = 0x6D
al &= 0x4A
pal();

al = 0b00001111
al |= 0x61
pal();

al = 0x94
al ^= 0x37
pal();
