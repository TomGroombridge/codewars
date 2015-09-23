class Hello

	def to_underscore(string)
		conversion = string.to_s
		if conversion == conversion.downcase
			return conversion
		end
		output = conversion.split /(?=[A-Z])/
		output.map {|a| a.downcase}.join(",").gsub!(',','_' )
	end


end

test = Hello.new
puts test.to_underscore("hello world")