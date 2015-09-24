# require './rspec'
require './lib/csv_import'

RSpec.describe 'csv import' do

	it "should return a error message if the amount requested is under £1000" do
		@quote = Quote.new
		expect(@quote.interest("./market.csv", 100.00)).to eq "I'm sorry but we only quote for requested amounts between £1000.00 and £15,000.00"
	end

	it "should return a error message if the amount requested is over £15000" do
		@quote = Quote.new
		expect(@quote.interest("./market.csv", 15001.00)).to eq "I'm sorry but we only quote for requested amounts between £1000.00 and £15,000.00"
	end

	it "should return a error message if the amount requested is not incremented by £100" do
		@quote = Quote.new
		expect(@quote.interest("./market.csv", 1501.00)).to eq "I'm sorry but you can only apply for a loan in increments of £100.00"
	end

	it "should return a error message if the path to the csv file does not exist" do
		@quote = Quote.new
		expect(@quote.interest("./other.csv", 1500.00)).to eq "sorry but the path you has specified for the file does not exists"
	end

	it "should return a error message if the file format is not '.csv' " do

	end

	it "should return error message if the requested amount exceeds the amount available from lenders" do
		@quote = Quote.new
		expect(@quote.interest("./market.csv", 15000.00)).to eq "sorry we can't offer you a quote at this time"
	end

	it "should return the interest rate of 7% for a £1000 quote with this csv" do
		@quote = Quote.new
		@quote.interest("./market.csv", 1000.00)
	end



end