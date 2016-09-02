class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    
    def highest_rated_comment
        comments.rating_desc.first
    end
    
    def lowest_rated_comment
        comments.rating_asc.first
    end
end
