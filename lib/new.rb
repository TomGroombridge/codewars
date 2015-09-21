# Complete the solution so that it strips all text that follows any of a set of comment markers passed in. Any whitespace at the end of the line should also be stripped out.

# Example:

# Given an input string of:

# apples, pears # and bananas
# grapes
# bananas !apples
# The output expected would be:

# apples, pears
# grapes
# bananas
# The code would be called like so:

# var result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# // result should == "apples, pears\ngrapes\nbananas"
# result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# # result should == "apples, pears\ngrapes\nbananas"



# def solution(input, markers)
  
# end





























# Sum of (Two) Squares

# We are asking for a function to take a positive integer value, and return a list of all positive integer pairs whose values - when squared- sum to the given integer.

# For example, given the parameter 25, the function could return two pairs of 5,0 and 3,4 because 5^2 + 0^2 = 25 and 3^2 + 4^2 = 25.

# We might express that in pseudo-code like this:

#     all_squared_pairs(25) == [[5,0],[3,4]];
# Here are the requirements:

# The return value should be a two dimensional array of positive integer pairs in any order.
# A parameter value that is not the sum of any two squares should simply return an empty array
# We will consider 5,0 and 0,5 to be equal pairs, disregarding the order. Do not list the same pair twice.
# The upper bound of the parameter value will be 2,147,483,647





# def all_squared_pairs(num) 
#  #max(num) === 2147483647
#  #Return every unique pair of numbers [a,b] where (a * a) + (b * b) = num;
#  #return value will be a two-dimensional array [[]]
# end




































# In the following 6 digit number:

# 283910

# 91 is the greatest sequence of 2 digits.

# Complete the solution so that it returns the largest five digit number found within within the number given.. The number will be passed in as a string of only digits. It should return a five digit integer. The number passed may be as large as 1000 digits.



# def solution(digits)

# end


































# Create a function that takes a Roman numeral as its argument and returns its value as a numeric decimal integer. You don't need to validate the form of the Roman numeral.

# Modern Roman numerals are written by expressing each decimal digit of the number to be encoded separately, starting with the leftmost digit and skipping any 0s. So 1990 is rendered "MCMXC" (1000 = M, 900 = CM, 90 = XC) and 2008 is rendered "MMVIII" (2000 = MM, 8 = VIII). The Roman numeral for 1666, "MDCLXVI", uses each letter in descending order.

# Example:

# solution('XXI') # should return 21
# Courtesy of rosettacode.org



# def solution(roman)
#   # complete the solution by transforming the 
#   # string roman numeral into an integer
# end