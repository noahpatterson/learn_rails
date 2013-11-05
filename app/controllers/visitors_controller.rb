class VisitorsController < ApplicationController
	def new
		#Rails.logger.debug "Debug: entering new methos"
		@owner = Owner.new
		#Rails.logger.debug "Debug: Owner name is " + @owner.name
	end
end
