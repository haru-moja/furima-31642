class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_message, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to new_user_session_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_message
    @item = Item.find(params[:id])
  end
end
