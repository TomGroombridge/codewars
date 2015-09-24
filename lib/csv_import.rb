require 'csv'

class Quote

	LOAN_TERM = 36


	def interest(path_to_file, number)
		@requested_amount = number
		if @requested_amount >= 1000 && @requested_amount <= 15000
			pull_in_lender_info(path_to_file)
		else
			puts "I'm sorry but we only quote for requested amounts between £1000.00 and £15,000.00"
		end
	end

	def pull_in_lender_info(path_to_file)
		@lenders = []
		if File.exists?(path_to_file)
			CSV.foreach(path_to_file, headers: true) do |row|
			  @lenders << {:name => row[0], :rate => row[1], :amount => row[2]}
			end
			order_lenders_by_interest
		else
			puts "sorry but the path you has specified does not exists"
		end
	end

	def order_lenders_by_interest
		@amount = @lenders.inject(0) {|sum, hash| sum + hash[:amount].to_f}
		@ordered_lenders = @lenders.sort_by { |hsh| hsh[:rate].to_f }
		@lenders_amounts = @ordered_lenders.map{|x| x[:amount].to_f}
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
		@lenders_amounts.each do |a|
			unless @i >= @requested_amount
				@lenders_needed += 1
				@i += a
			end
		end
		compound_interest
	end

	def compound_interest
		@rate = (@ordered_lenders.first(@lenders_needed).inject(0) {|sum, hash| sum + hash[:rate].to_f} / @lenders_needed).round(2)
		set_principal_payment
	end

	def set_principal_payment
		@principal_payment = (@requested_amount / LOAN_TERM)
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
		@monthly_repayments = (@total_repayments / LOAN_TERM).round(2)
		@total_repayments = (@monthly_repayments * LOAN_TERM).round(2)
		send_quote
	end

	def send_quote
		puts " Requested amount: £#{@requested_amount}"
		puts " Rate: #{(@rate.round(2)* 100.0).round(1)}%"
		puts " Monthly repayment: £#{@monthly_repayments.round(2)}"
		puts " Total repayment: £#{@total_repayments.round(2)}"
	end

	def no_loan
		puts "sorry we can't offer you a quote at this time"
	end

end

@quote = Quote.new
puts @quote.interest("./market.csv", 1000.00)
