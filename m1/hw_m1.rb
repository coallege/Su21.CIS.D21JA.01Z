require "readline"

trap "SIGINT" do
   puts ""
   exit 0
end

def gets()
   return Readline.readline("<- ", true)
end

puts "How many bits is a word?"
# $wordsize = (gets or 24).to_i
$wordsize = 24
$uwordmax = (1 << $wordsize) - 1
$swordmax = (1 << ($wordsize - 1)) - 1
$swordmin = -(1 << ($wordsize - 1))

def truncate(val)
   return val & $uwordmax
end

puts "A word is now #{$wordsize} bits."

puts "<- [0x]dead op [0x]bad"
puts "(+)  unsigned addition"
puts "(-)  unsigned subtraction"
puts "(~+)   signed addition"
puts "(~-)   signed subtraction"

def f(res, msg)
   puts "-> #{res.to_s 16} (#{msg})"
end

loop do
   lhs, op, rhs = gets.split
   lhs = lhs.to_i 16
   rhs = rhs.to_i 16

   if lhs < 0 or rhs < 0
      puts "-e Both hex_numbers must be positive!"
      next
   end

   case op
   when "+"
      if lhs > $uwordmax or rhs > $uwordmax
         puts "-e Already overflows before operation!"
         next
      end
      res = lhs + rhs
      if lhs > $uwordmax
         res = truncate res
         f res, "Overflow"
      else
         f res, "No Overflow"
      end
   when "-"
      if lhs > $uwordmax or rhs > $uwordmax
         puts "-e Already overflows before operation!"
         next
      end
      res = lhs - rhs
      if res < 0
         res = truncate (-res)
         f res, "Underflow"
      else
         f res, "No Underflow"
      end
   when "~+"
      if lhs > $swordmax or rhs > $swordmax
         puts "-e Positive integer overlows into negative before operation!"
         next
      end
      # exact same operations as (+)
      res = lhs + rhs
      if res > $swordmax
         # with different interpretation
         res = truncate $swordmin + res
         f res, "Overflow"
      else
         f res, "No Overflow"
      end
   when "~-"
      if lhs > $swordmax or rhs > $swordmax
         puts "-w Positive integer overlows into negative before operation!"
         puts "-w Continuing anyways..."
      end
      res = truncate lhs + (~rhs + 1)
      if res > $swordmax
         res = truncate $swordmin + res
         f res, "Overflow"
      else
         f res, "No Overflow"
      end
   else
      puts "-e I don't know what '#{op}' is!"
   end
end
