class Dish < ActiveRecord::Base
  has_many :orders, inverse_of: :dish
  validates :name, :price, :stock, :restaurant, :restaurantURL, :imageURL, presence: true
end
