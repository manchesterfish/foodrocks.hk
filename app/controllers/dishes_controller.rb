class DishesController < ApplicationController
before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def admin
    @dishes = Dish.all
  end

  # GET /dishes
  def index
    @dishes = Dish.all
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def edit
  end

  def create
    @dish = Dish.new(dish_params)

  end

  def update
  end

  def destroy
    @dish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:dish_name, :price, :stock, :restaurant, :restaurantURL, :ImageURL)
    end
end
