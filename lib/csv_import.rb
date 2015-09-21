require 'csv'

@lenders = []
@array = []
CSV.foreach("../market.csv") do |row|
  lender, rate, available = row
  next if row[0] == "Lender"
	@lenders << {'name' => row[0], 'compound_interest' => row[1], 'amount' => row[2]}
end
@lenders.each {|l| @array << l.values_at('amount')}
@test = @array.flatten.map(&:to_i)

@i = 0
@num = 1870

@amount = []
until  @i > @num do
  @test.each do |feed|
    @amount << (@i += feed)
  end
end
puts @amount.inspect