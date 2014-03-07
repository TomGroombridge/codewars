# require "./lib/presents"

# 	describe "presents" do 

# 		it "should have lots of different types of outcomes" do 
# 			values = {"size" =>["small","medium","large"], "clatters" =>["no","a bit","yes"], "weight" =>["light","medium","heavy"]}
# 			wishlist = [ {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
#         {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
#         {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
#       ]
#       presents = [
#         {:size => "medium", :clatters => "a bit", :weight => "medium"},
#         {:size => "small", :clatters => "yes", :weight => "light"}
#       ]

# 			expect(guess_gifts(wishlist, presents)).to eq ['toy car', 'mini puzzle']
# 		end

# 	end 