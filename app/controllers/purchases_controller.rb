class PurchasesController < ApplicationController
  before_action :set_item
  def index
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.permit(:post_code, :area_id, :city, :street_number, :buildings, :phone_number)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
