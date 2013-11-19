class ContactsController < ApplicationController

	# def process_form
	# 	Rails.logger.debug "Debug: params are #{params}"
	# 	flash[:notice] = "Received request from #{params[:contact][:name]}"
	# 	redirect_to root_path
	# end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(secure_params)
		if @contact.valid?
			#todo save data
			@contact.update_spreadsheet
			#todo send message
			flash[:notice] = "Message sent from #{@contact.name}"
			# flash[:notice] = "Message sent to Google Drive"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def secure_params
		params.require(:contact).permit(:name, :email,:content)
	end
end