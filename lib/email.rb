def validate(email)
	if /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/.match(email)
		true
	else
		false
	end
end




