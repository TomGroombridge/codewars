def to_underscore(string)
	conversion = string.to_s
	if conversion == conversion.downcase
		return conversion
	end
	output = conversion.split /(?=[A-Z])/
	output.map {|a| a.downcase}.join(",").gsub!(',','_' )
end



p to_underscore('helloWol')
