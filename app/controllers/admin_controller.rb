class AdminController < ApplicationController

  def dishes
    @dishes = Dish.all
  end

  def orders
    @orders = Order.all
  end

  def feedbacks
    @feedbacks = Feedback.all
  end
  
end
