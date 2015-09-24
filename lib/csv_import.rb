require 'csv'

class Hello

	def interest(number)
		@requested_amount = number
		pull_in_lender_info
	end

	def pull_in_lender_info
		@lenders = []
		CSV.foreach("./market.csv", headers: true) do |row|
		  @lenders << {:name => row[0], :compound_interest => row[1], :amount => row[2]}
		end
		order_lenders_by_interest
	end

	def order_lenders_by_interest
		@amount = @lenders.inject(0) {|sum, hash| sum + hash[:amount].to_f}
		@lenders = @lenders.sort_by { |hsh| hsh[:compound_interest] }
		@ordered_lenders = @lenders.map{|x| x[:amount].to_f}
		check_for_loan
	end

	def check_for_loan
		if @requested_amount > @amount
			no_loan
		else
			lenders_needed
		end
	end

	def lenders_needed
		@lenders_needed = 0
		@i = 0
		@ordered_lenders.each do |a|
			unless @i >= @requested_amount
				@lenders_needed += 1
				@i += a
			end
		end
		set_loan
	end

	def set_loan
			@total_compound_interest = []
			@lenders.first(@lenders_needed).each {|l| @total_compound_interest << l.values_at(:compound_interest)}
			@rate = (@total_compound_interest.flatten.map(&:to_f).inject(:+) / @lenders_needed).round(2)
			@principal_payment = (@requested_amount / 36).round(2)
			@remaining_principal = @requested_amount
			@monthly_total = 0
			until @remaining_principal <= 0 do
				@interest_per_month = ((@remaining_principal * @rate) / 12)
				@monthly_payment = (@principal_payment + @interest_per_month).round(2)
				@monthly_total += @monthly_payment
				@remaining_principal = (@remaining_principal - @principal_payment)
			end
			@total_repayments = @monthly_total
			@monthly_repayments = (@monthly_total / 36)
			puts "the amount requested was #{@requested_amount}, we can offer a loan at a rate of #{@rate.round(2)} with monthly repayments of #{@monthly_repayments.round(2)} with a total repayment of #{@total_repayments}"
	end

	def no_loan
		puts "sorry we can't offer you a loan"
	end

end

test = Hello.new
puts test.interest(1000.00)
