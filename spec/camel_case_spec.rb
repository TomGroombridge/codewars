require "./lib/camel_case"

describe "camel case" do 

	it "should return the string" do 
		expect(to_underscore('helloworld')).to eq 'helloworld'
	end

	it "should return the string with a underscore" do 
		expect(to_underscore('helloWorld')).to eq 'hello_world'
	end
	end