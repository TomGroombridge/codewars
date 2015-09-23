require 'csv'

class Hello

	def interest(number)
		@amount_request = number
		@lenders = []
		CSV.foreach("./market.csv", headers: true) do |row|
		  @lenders << {'name' => row[0], 'compound_interest' => row[1], 'amount' => row[2]}
		end


		@lenders = @lenders.sort_by { |hsh| hsh['compound_interest'] }
		@amount_of_each_lender = @lenders.map{|h| h["amount"] }

		@amount = @amount_of_each_lender.flatten.map(&:to_f)
		@amount_in_bank = @amount.inject(:+)


		if @amount_request > @amount_in_bank
			puts "sorry we can't offer you a loan"
		else
			@lenders_needed = []
			@i = 0

			@amount.each do |a|
				unless @i >= @amount_request
					@i += a
					@lenders_needed << @i
				end
			end

			@compound_interest = []
			@lenders.first(@lenders_needed.count).each {|l| @compound_interest << l.values_at('compound_interest')}
			@total_interest = @compound_interest.flatten.map(&:to_f).inject { |sum, n| sum + n }
			@compound_interest = (@total_interest / @lenders_needed.count).round(2)
			@principal_payment = (@amount_request / 36).round(2)
			@remaining_principal = (@amount_request)
			@monthly_total = []

			until @remaining_principal <= 0 do
				@interest_per_month = ((@remaining_principal * @compound_interest) / 12)
				@monthly_payment = (@principal_payment + @interest_per_month).round(2)
				@monthly_total << @monthly_payment
				@remaining_principal = (@remaining_principal - @principal_payment)
			end

			@total_repayments = @monthly_total.inject(:+)
			@monthly_repayments = (@monthly_total.inject(:+) / 36)

			puts "the amount requested was #{@amount_request}, we can offer a loan at a rate of #{@compound_interest.round(2)} with monthly repayments of #{@monthly_repayments.round(2)} with a total repayment of #{@total_repayments}"
		end
	end
end

test = Hello.new
puts test.interest(1000.00)
