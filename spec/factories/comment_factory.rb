FactoryGirl.define do
  factory :comment do
  	
  	rating 3
  	association :user, strategy: :build
  	association :product, strategy: :build
  	body "Excellent product!"
  
  end

end