require 'csv'
class Quote

	def interest(path_to_file, number)
		@requested_amount = number
		pull_in_lender_info(path_to_file)
	end

	def pull_in_lender_info(path_to_file)
		@lenders = []
		CSV.foreach(path_to_file, headers: true) do |row|
		  @lenders << {:name => row[0], :rate => row[1], :amount => row[2]}
		end
		order_lenders_by_interest
	end

	def order_lenders_by_interest
		@amount = @lenders.inject(0) {|sum, hash| sum + hash[:amount].to_f}
		@lenders = @lenders.sort_by { |hsh| hsh[:rate] }
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
		compound_interest
	end

	def compound_interest
		@total_compound_interest = []
		@lenders.first(@lenders_needed).each {|l| @total_compound_interest << l.values_at(:rate)}
		set_rate
	end

	def set_rate
		@rate = (@total_compound_interest.flatten.map(&:to_f).inject(:+) / @lenders_needed)
		set_principal_payment
	end

	def set_principal_payment
		@principal_payment = (@requested_amount / 36)
		set_repayments
	end

	def set_repayments
		@remaining_principal = @requested_amount
		@total_repayments = 0
		until @remaining_principal <= 0 do
			@interest_per_month = ((@remaining_principal * @rate) / 12)
			@total_repayments += (@principal_payment + @interest_per_month)
			@remaining_principal = (@remaining_principal - @principal_payment)
		end
		@total_repayments
		@monthly_repayments = (@total_repayments / 36)
		send_quote
	end

	def send_quote
		puts " Requested amount: £#{@requested_amount}"
		puts " Rate: #{(@rate.round(2)* 100.0).round(1)}%"
		puts " Monthly repayment: £#{@monthly_repayments.round(2)}"
		puts " Total repayment: £#{@total_repayments.round(2)}"
	end

	def no_loan
		puts "sorry we can't offer you a loan"
	end

end

@quote = Quote.new
puts @quote.interest("./market.csv", 1000.00)
