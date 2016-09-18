require 'rails_helper'

describe User do
    context "when user is created" do
        it "should have an email" do
            expect(User.new(password: "12345678")).not_to be_valid
        end
        
        it "should have a password" do
            expect(User.new(email: "test@example.com")).not_to be_valid
        end
    end
end