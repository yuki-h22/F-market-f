class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @item.images.build
    @item.build_category
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end
  
  def show
    render layout: 'items_show'
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:name,:text,:condition,:fee_burden,:service,:area,:handing_time,:price,:trading_status,:service,:category_id, 
    images_attributes:[:image_url]).merge(seller_user_id:1)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end