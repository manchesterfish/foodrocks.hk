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

    @order.time = Time.now.strftime("%m月%d日")

    respond_to do |format|
        if @order.save
          format.html { redirect_to dish_order_path(@dish, @order), notice: 'Order was successfully created.' }
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
      format.html { redirect_to admin_orders_path, notice: 'Order was successfully updated.' }
    else
      format.html { redirect_to admin_orders_path, notice: 'Oop! Order is not updated' }
    end

  end

  def destroy
    @order = @dish.orders.find( params[:id] )
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_orders_path, notice: 'Order was successfully destroyed.' }
    end
  end

  private

    def find_dish
      @dish = Dish.find(params[:dish_id] )
    end

    def order_params
      params.require(:order).permit(:dish_id, :phone, :time)
    end

  end
