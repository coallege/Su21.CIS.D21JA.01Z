class Memory
   attr_reader :size
   attr_reader :mask
   attr_reader :bits

   def initialize(size, bits = 0)
      puts "init"
      size = size.to_i
      bits = bits.to_i

      @size = size
      @mask = 2 ** size - 1
      if bits < 0
         raise TypeError.new "bits must be positive"
      end
      @bits = bits & @mask
      puts mem
   end

   def not
      bits = 0
      i = @size
      while not i < 0
         
      puts @bits.to_s(2).split()
      bits = @bits.to_s(2).split("").map{ |c| c == '0' ? '1' : '0' }
      # return Memory.new @size, bits
   end

   def add(bits)
      if bits < 0
         raise TypeError.new "val must be positive"
      end
      return Memory.new @size, @bits + bits
   end

   def mem
      s = Array.new(@size){ |i| (@bits >> i) & 0b1 }.reverse.join
      return "mem#{@size}{#{s}}"
   end
end
