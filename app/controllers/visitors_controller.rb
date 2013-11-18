class VisitorsController < ApplicationController
	def new
		#Rails.logger.debug "Debug: entering new methos"
		@owner = Owner.new
		#Rails.logger.debug "Debug: Owner name is " + @owner.name
		# flash.now[:notice] = "Welcome!"
		# flash.now[:alert] = "My birthday is soon"
	end
end
