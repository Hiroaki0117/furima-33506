class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ]
  before_action :move_to_index_edit, only: [:edit]
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
    id_params
  end

  def edit
  end

  def update
    id_params
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

  def id_params
    @item = Item.find(params[:id])
  end

  def move_to_index_edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path 
    end
  end
end


