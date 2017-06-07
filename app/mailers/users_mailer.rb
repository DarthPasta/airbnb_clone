class UsersMailer < ApplicationMailer
	default from: "liowj.nick@gmail.com"

	def sample_email(user)
		@user = user 
		mg_client = Mailgun::Client.new ENV['api_key']
		message_params = {:from => ENV[:'gmail_username']
			:to => @user.email, 
			:subject => 'Sample mail using mailgun API',
			:text => 'This mail is sent using mailgun API'}
		mg_client.send_message ENV['domain'], message_params
	end
end
