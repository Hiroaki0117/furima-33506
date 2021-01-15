class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :state_id, :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
