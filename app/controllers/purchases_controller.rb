class PurchasesController < ApplicationController
  before_action :set_item
  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:post_code, :area_id, :city, :street_number, :buildings, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_bb63b2b0c1427452101cbb48"
    Payjp::Charge.create(
      amount: set_item[:price],
      card: purchase_params[:token],
      currency: "jpy"
    )
  end
end
