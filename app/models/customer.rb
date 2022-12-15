class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name 
      return "#{self.first_name} #{self.last_name}" 
    end

    def favorite_restaurant
      favorite = self.reviews.all.max_by {|x| x.star_rating}
      return favorite.restaurant
    end

    def add_review(restaurant, rating)
      return Review.create(star_rating: rating, restaurant_id: restaurant.id)
    end

    #NOT FINISHED
    def delete_reviews(restaurant)
      reviewed = self.restaurants.include?(restaurant.id)
      if reviewed
        return reviewed.reviews
      else
        return "User did not review this restaurant"
      end
      # return restaurant.reviews.delete_all
    end
end