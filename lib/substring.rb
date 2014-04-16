def search_substr(fullText, searchText)
	 if searchText == ""
	 	return 0
	 end
	 fullText.scan(searchText).length
end


 p search_substr("aaa", "aa")