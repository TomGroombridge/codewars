require "./lib/spin_words"

describe "reverse words" do 

	it "Should return all the words that are longer than 5 letters in reverse"do 
	expect(spinWords( "Hey fellow warriors" )).to eq  "Hey wollef sroirraw"
end

	end