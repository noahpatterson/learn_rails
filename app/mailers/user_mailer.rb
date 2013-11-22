class UserMailer < ActionMailer::Base
	default from: "do-not-reply@noah-patterson.com"

	def contact_email(contact)
		@contact = contact
		mail(to: ENV["OWNER_EMAIL"], from: @contact["email"], :subject => "Website Contact")
		# mail(to: ENV["OWNER_EMAIL"], from: @contact.email, :subject => "Website Contact")

	end
end