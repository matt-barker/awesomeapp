class UserMailer < ApplicationMailer
    default from: 'mailer@awesomegear.uk'

    def contact_form(email, name, message)
        @message = message
        mail(:from => email,
        :to => 'matt@mattbarker.net',
        :subject => "A new contact form message from #{name}",
        :body => "Test")
    end
    
    def welcome(user)
        @appname = "Awesome Gear"
        mail( :to => user.email,
        :subject => "Welcome to #{@appname}!",
        :body => "Test")
    end
end
