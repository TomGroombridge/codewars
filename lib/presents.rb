def guess_gifts(wishlist, presents)
wishlist.each {|key| p key[:size] }

end



presents = [
        {:size => "medium", :clatters => "a bit", :weight => "medium"},
        {:size => "small", :clatters => "yes", :weight => "light"}
      ]

wishlist = [ {:name => "mini puzzle", :size => "small", :clatters => "yes", :weight => "light"},
        {:name => "toy car", :size => "medium", :clatters => "a bit", :weight => "medium"},
        {:name => "card game", :size => "small", :clatters => "no", :weight => "light"}
      ]

 guess_gifts(wishlist, presents)

