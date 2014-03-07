def title_case(title, minor_words)

	 p title.downcase.split.inject([]) {|words, w| words << (minor_words.downcase.split.include?(w) && words.any? ? w : w.capitalize)}.join(' ')

end	  


title_case("Hello world i am james", "i am")