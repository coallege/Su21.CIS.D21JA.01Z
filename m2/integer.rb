require_relative "memory"

def uany(size, val)
   return Memory.new size, val
end

def u8(val)
   return uany 8, val
end

class Memory
   def to_us(radix = 10)
      s = ""
      a = @bits
      while a > 0
         s = (a % r).to_s + s
         a = a / r
      end
      return "u#{@size}:#{r}{#{s}}"
   end
end

def iany(size, val)
   if val < 0
      return Memory.new(size, -val).not.add(1)
   else
      return Memory.new(size, val)
   end
end

def i8(val)
   return iany 8, val
end

class Memory
   def to_is(r = 10)
      puts mem
      # msb_mask = Memory.new @size, 1 << (@size - 2)
      # puts msb_mask.mem
      # a = @bits & (2 ** @size - 1)
      # sign = @bits >> (@size - 1)
      # if sign == 0
      #    s = ""
      # else
      #    s = "-"
      #    a = ~a + 1
      # end

      # while a > 0
      #    s = (a % r).to_s + s
      #    a = a / r
      # end

      # return "i#{@size}:#{r}{#{s}}"
   end
end

puts iany(4, -1).mem
