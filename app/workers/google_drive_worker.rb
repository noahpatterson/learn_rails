class GoogleDriveWorker
	include Sidekiq::Worker
	sidekiq_options :retry => false

	def perform(contact)
		# a = Contact.new
		
		a = Contact.new
		a.name = contact["name"]
		a.email = contact["email"]
		a.content = contact["content"]
		# logger.info "#{a.email}"
		a.update_spreadsheet
	end
end

	