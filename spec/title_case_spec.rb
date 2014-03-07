require "./lib/title_case"

describe "title case" do 

	it "should return the first letter of a string as a capital" do 
		string = "hello world what is your name"
		minor_words = "world"

		expect(title_case(string, minor_words)).to eq "Hello world What Is Your Name" 
	end

	it "should capitalize the first letter of every word" do 
		string = "hello world i am tom"
		minor_words = "i am"
		expect(title_case(string, minor_words)).to eq "Hello World i am Tom" 
	end 

	it "should have a second arguement which holds minor words" do 
		string = "hello world"
		minor_words = "world"
		expect(title_case(string, minor_words)).to eq "Hello world" 
	end

	it "should not capitalize minor words" do 
		string = "hello world i am james"
		minor_words = "i am "
		expect(title_case(string, minor_words)).to eq "Hello World i am James"
	end

	it "should work with CAPITALS" do 
		string = "HELLO WORLD"
		minor_words = "World"
		expect(title_case(string, minor_words)).to eq "Hello world"
	end

	it "shoudl work for words that dont exist" do 
		string = "First a of in"
		minor_words = "an often into"
		expect(title_case(string, minor_words)).to eq "First A Of In"
	end

	end




# 	A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

# Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

# javascript/coffeescript

# titleCase('a clash of KINGS', 'a an the of') // should return: 'A Clash of Kings'
# titleCase('THE WIND IN THE WILLOWS', 'The In') // should return: 'The Wind in the Willows'
# titleCase('the quick brown fox') // should return: 'The Quick Brown Fox'
# ruby

# title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
# title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
# title_case('the quick brown fox') # should return: 'The Quick Brown Fox'