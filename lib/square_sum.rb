def squareSum(array)
	sum = 0
	power = array.map do |n|
	 sum+= n*n
end
p sum
end



 squareSum([1,2,3])





#  Complete the squareSum method so that it squares each number passed into it and then sums the results together.

# For example:

# squareSum([1,2, 2]) # should return 9