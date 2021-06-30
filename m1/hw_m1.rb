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
      puts "-x Both hex_numbers must be positive!"
      next
   end

   case op
   when "+"
      if lhs > $uwordmax or rhs > $uwordmax
         puts "-x Already overflows before operation!"
         next
      end
      res = lhs + rhs
      if lhs > $uwordmax
         # modulo might be a bit overkill here since it can only wrap around once
         res = truncate res
         f res, "Overflow"
      else
         f res, "No Overflow"
      end
   when "-"
      if lhs > $uwordmax or rhs > $uwordmax
         puts "-x Already overflows before operation!"
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
         puts "-x Positive integer overlows into negative before operation!"
      end
      # exact same operations as (+)
      res = lhs + rhs
      if res > $swordmax
         # with different interpretation
         res = $swordmin + res % $swordmax
         f res, "Overflow"
      else
         f res, "No Overflow"
      end
   when "~-"
      if lhs > $swordmax or rhs > $swordmax
         puts "-x Positive integer overlows into negative before operation!"
      end
      res = truncate lhs + (~rhs + 1)
      if res > 0
         f res, "Underflow"
      else
         f res, "No Underflow"
      end
   else
      puts "-x I don't know what '#{op}' is!"
   end
end
