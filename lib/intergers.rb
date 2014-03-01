def narcissistic?(value)
	 power = value.to_s.split(//).map(&:to_i)
	 sum = power.map{|x| x**power.length}.inject(:+)
	 if sum == value
	 	true
	 else
	 	false
	 end
end

