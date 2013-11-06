class Owner

	def name
		name = 'Noah Patterson'
	end

	def birthdate
		birthdate = Date.new(1985,2,2)
	end

	def countdown
		# Rails.logger.debug "\033[1;34;40m[DEBUG]\033[0m " + 'will appear in bold blue'
		# Rails.logger.debug 'Debug: entering Owner countdown method'
		today = Date.today
		birthday = Date.new(today.year, birthdate.month, birthdate.day)
		if birthday > today
			countdown = (birthday -	today).to_i
		else
			countdown = (birthday.next_year - today).to_i
		end
	end

	def months_till
		months = countdown / 30
	end

	def hours_till
		time = Time.now
		hours = (24 - time.hour) + ((countdown - 1) * 24)
	end

	def minutes_till
		time = Time.now
		minutes = (60 - time.min) + ((hours_till - 1)* 60)
	end

	def seconds_till 
		time = Time.now
		seconds = (60 - time.sec)+ ((minutes_till - 1) * 60)
	end

end
