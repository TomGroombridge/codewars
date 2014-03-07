def createPhoneNumber(numbers)
	string = numbers.join(",").gsub(/[,]/, '')
	p numbers = "(#{string[0..2]}) #{string[3..5]}-#{string[6..9]}"
end

createPhoneNumber([2, 3, 3, 9, 5, 6, 7, 8, 9, 0])



 