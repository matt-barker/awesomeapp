require 'rails_helper'

describe Product do
    
    context "when the product has comments" do
        before do
            @product = Product.create!(name: "yamaha piano")
            @user = User.create!(email: "test@example.com", password: "12345678")
            @product.comments.create!(rating: 1, user: @user, body: "Awful!")
            @product.comments.create!(rating: 3, user: @user, body: "Not bad")
            @product.comments.create!(rating: 5, user: @user, body: "Excellent!")
        end
        
        it "returns the average rating of all comments" do
            expect(@product.comments.average(:rating).to_f).to eq 3
        end
        
        it "is invalid" do
            expect(Product.new(description: "Nice piano")).not_to be_valid
        end
        
    end
    
end