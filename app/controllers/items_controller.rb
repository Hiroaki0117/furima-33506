class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ]
  def index
    @items = Item.order(created_at: "DESC").includes(:user)
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
    @item = Item.find(params[:id])
  end

  def edit
    unless user_signed_in?
      redirect_to user_session_path
    end
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :delivery_fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
