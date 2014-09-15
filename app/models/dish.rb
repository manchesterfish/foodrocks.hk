class Dish < ActiveRecord::Base
  has_many :orders, inverse_of: :dish
end
