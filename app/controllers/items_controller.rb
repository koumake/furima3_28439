class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end
  def update
    if Item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
    
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  def index
    @items = Item.order(created_at: :DESC).includes(:user)
    
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
  
    
       
  
  
  
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :about, :price, :genre_id, :condition_id, :delivery_fee_id, :day_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
