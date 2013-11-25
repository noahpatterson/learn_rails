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
		respond_to do |format|
			if @contact.valid?
				format.html {redirect_to root_path, flash[:notice] = "Message sent from #{@contact.name}"}
				format.js {render 'create'}
				#todo save data
				# @contact.update_spreadsheet
				
				GoogleDriveWorker.perform_async(@contact.as_json)
				#todo send message
				# UserMailer.contact_email(@contact).deliver
				MailWorker.perform_async(@contact.as_json)
				# flash[:notice] = "Message sent from #{@contact.name}"
				# flash[:notice] = "Message sent to Google Drive"
				# redirect_to root_path
			else
				format.html {redirect_to root_path}
				format.js {render 'error'}
			end
		end

	end

	private

	def secure_params
		params.require(:contact).permit(:name, :email,:content)
	end
end