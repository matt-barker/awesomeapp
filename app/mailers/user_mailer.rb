class UserMailer < ApplicationMailer
    default from: 'mailer@awesomegear.uk'

    def contact_form(email, name, message)
        @message = message
        mail(:from => email,
        :to => 'matt@mattbarker.net',
        :subject => "A new contact form message from #{name}")
    end
end
