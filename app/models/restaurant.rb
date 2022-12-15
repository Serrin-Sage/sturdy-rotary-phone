class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def Restaurant.fanciest
      return Restaurant.all.max_by {|x| x.price}
    end

    def all_reviews
      restaurant_customers = self.customers
      review_array = self.reviews
      
      self.reviews.map {|x| 

        x.full_review

      }
    end
end