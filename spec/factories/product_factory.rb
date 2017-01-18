FactoryGirl.define do
	sequence(:name) { |n| "product #{n}" }
    
    factory :product do
        name "Yamaha Piano"
        description "Test"
        image_url "example/1"
        price 499
    end

end