class MailWorker
	include Sidekiq::Worker
	sidekiq_options :retry => false

	def perform(contact)
		@contact = contact
		UserMailer.delay.contact_email(@contact)
	end
end

	