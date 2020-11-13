class PurchasesController < ApplicationController
  before_action :set_item
  before_action :move_to_signup
  before_action :move_to_index
  before_action :move_to_root
  def index
    binding.pry
    @order_form = OrderForm.new
  end
  
  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      binding.pry
      @order_form.save
      redirect_to root_path
    else
      render action: :index

    end
  end

  private

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end
  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
  def move_to_root
    redirect_to root_path if @item.purchase != nil
  end



  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
