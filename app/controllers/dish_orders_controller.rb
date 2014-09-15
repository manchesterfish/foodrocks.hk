  class DishOrdersController < ApplicationController
  before_filter :find_dish

  def index
    @orders = @dish.orders
  end

  def show
    @order = @dish.orders.find( params[:id] )
  end

  def new
    @order = @dish.orders.build
  end

  def create
    @order = @dish.orders.build(order_params)

    @order.time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    respond_to do |format|
        if @order.save
          format.html { redirect_to dish_orders_url(@dish), notice: 'Order was successfully created.' }
        else
          format.html { render "errors" , :locals=>{:order=>@order} }
        end
      end
  end

  def edit
    @order = @dish.orders.find( params[:id] )
  end

  def update
    @order = @dish.orders.find( params[:id] )

    if @order.update_attributes( order_params )
      redirect_to dish_orders_url( @dish )
    else
      render :action => :new
    end

  end

  def destroy
    @order = @dish.orders.find( params[:id] )
    @order.destroy

    redirect_to dish_orders_url( @dish )
  end

  private

    def find_dish
      @dish = Dish.find( params[:dish_id] )
    end

    def order_params
      params.require(:order).permit(:dish_id, :phone, :time)
    end

  end
