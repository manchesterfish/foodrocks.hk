class AdminController < ApplicationController

  USERS = { "admin" => "foodrocks" }

  before_action :authenticate

  def dishes
    @dishes = Dish.all
  end

  def orders
    @orders = Order.all
  end

  def feedbacks
    @feedbacks = Feedback.all
  end

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end

end
