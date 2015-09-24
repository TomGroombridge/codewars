# require './rspec'
require './lib/csv_import'

RSpec.describe 'csv import' do
	let(:quote) {Quote.new}

	it "should return a error message if the amount requested is under £1000" do
	end

	it "should return a error message if the amount requested is over £15000" do

	end

	it "should return a error message if the amount requested is not incremented by £100" do

	end

	it "should return a error message if the path to the csv file does not exist" do

	end

	it "should return a error message if the file format is not '.csv' " do

	end

	it "should return error message if the requested amount exceeds the amount available from lenders" do

	end

	it "should return the interest rate of 7% for a £1000 quote with this csv" do

	end

	it "should be able to sort lender by rate available" do
		stub_const("ARGV", ['market_file', 15001])
		expect(quote.correct_amount).to be false
		expect(quote.validate_quote).to eq "I'm sorry but we only quote for requested amounts between £1000.00 and £15,000.00"
	end



end