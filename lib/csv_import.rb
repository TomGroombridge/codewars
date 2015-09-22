require 'csv'



@amount_request = 2331
@lenders = []
CSV.foreach("../market.csv", headers: true) do |row|
  @lenders << {'name' => row[0], 'compound_interest' => row[1], 'amount' => row[2]}
end


@lenders = @lenders.sort_by { |hsh| hsh['compound_interest'] }
@amount_of_each_lender = @lenders.map{|h| h["amount"] }



@amount = @amount_of_each_lender.flatten.map(&:to_f)
@amount_in_bank = @amount.inject(:+)

puts "These is #{@amount_in_bank} funds in the bank"
puts @amount.inspect

if @amount_request > @amount_in_bank
	puts "sorry we can't offer you a loan"
else
	@lenders_needed = []
	@i = 0
	@amount.each do |a|
		unless @i >= @amount_request
			@lenders_needed << @i
			@i += a
		end
	end
	puts "#{@lenders_needed.count} lenders are needed for this armount requested"
	@compound_interest = []
	@lenders.first(@lenders_needed.count).each {|l| @compound_interest << l.values_at('compound_interest')}
	@test = @compound_interest.flatten.map(&:to_f).inject { |sum, n| sum + n }
end
