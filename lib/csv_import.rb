require 'csv'



@amount_request = 1500
@lenders = []
CSV.foreach("../market.csv", headers: true) do |row|
  @lenders << {'name' => row[0], 'compound_interest' => row[1], 'amount' => row[2]}
end


@lenders = @lenders.sort_by { |hsh| hsh['compound_interest'] }
@amount_of_each_lender = @lenders.map{|h| h["amount"] }
# puts @amount_of_each_lender.flatten.map(&:to_f)




@i = 0
@amount = @amount_of_each_lender.flatten.map(&:to_f).map {|feed| @i += feed }
puts @amount

if @amount_request > @amount.last
	puts "sorry we can't offer you a loan"
else
	puts "congratulations we can offer you a loan"
	@lenders_needed = []
	@amount.each_with_index { |a, b| @lenders_needed << b unless a >= @amount_request}
	puts @lenders_needed.count



	@compound_interest = []
	@lenders.first(@lenders_needed.count).each {|l| @compound_interest << l.values_at('compound_interest')}
	@test = @compound_interest.flatten.map(&:to_f).inject { |sum, n| sum + n }

	puts (@test/@lenders_needed.count)
end


# puts @lenders_needed

# puts @amount.last
#this is not quite correct as it needs to add another 'needed' if the number is more than the one before and less than the noe after



