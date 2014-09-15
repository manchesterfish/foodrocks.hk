class DishesController < ApplicationController
before_action :set_dish, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @dish.save
        format.html { redirect_to admin_dishes_path, notice: 'Dish was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to admin_dishes_path, notice: "Dish #{@dish.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to admin_dishes_path, notice: 'Dish was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :price, :stock, :restaurant, :restaurantURL, :imageURL)
    end
end
