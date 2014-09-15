class Order < ActiveRecord::Base
    belongs_to :dish
    validates :dish, presence: true
    validates :phone, presence: true
    validates :phone, format: { with: /[0-9]{8}/, message: "Not a valid HK Phone Number" }
    validate :order_amount_cannot_exceeds_dish_stock
    def order_amount_cannot_exceeds_dish_stock
      if dish.orders.size > dish.stock
        errors[:base] << "This dish has been sold out !"
      end
    end
end
