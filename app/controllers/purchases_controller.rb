class PurchasesController < ApplicationController

    def index
        @purchase = UserPurchase.new
        @item = Item.find(params[:item_id])
    end
      
    def create
        @purchase = Purchase.new
        if @purchase.valid?
          pay_item
          @order.save
          return redirect_to root_path
        else
          render 'index'
        end
    end

    private
    
    def user_purchase_params
        # params.require(:user_purchase).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel)
        params.require(:user_purchase).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id)
    end
    
end
