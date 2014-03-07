# my soultion

ROMAN = {1 => "I", 4 => "IV", 5 => "V", 9 => "IX", 10 => "X", 40 => "XLIX", 50 => "L", 60 => "LX", 90 => "XC", 100 => "C", 500 => "D", 900 => "CM", 1000 => "M", 2008 => "MMVIII"}

def solution(number)
	raise "The number requested must be positive" unless number > 0
	result = ""
	while number > 0
		 ROMAN.keys.reverse.each do |key|
			if number >= key
				number = number - key
				result << ROMAN[key]
			end
		end
	end
	result
end

p solution(2008)



# best solution 

# NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
#                L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

# def solution(number)
#   return '' if number <= 0
#   NUMERALS.each { |key, val| return key.to_s + solution(number - val) if number >= val }
# end

