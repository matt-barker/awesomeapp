class Product < ApplicationRecord
    has_many :orders
    has_many :comments
    
    scope :price_desc, -> { order(price: :desc)  }
    scope :price_asc, -> { order(price: :asc)  }
    
    validates :name, presence: true
    
    def highest_rated_comment
        comments.rating_desc.first
    end
    
    def lowest_rated_comment
        comments.rating_asc.first
    end
    
    def average_rating
        comments.average(:rating).to_f
    end
end
