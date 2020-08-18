class PurchasesController < ApplicationController

    def index
        @purchase = UserPurchase.new
        @item = Item.find(params[:item_id])
    end
      
    def create
        @purchase = UserPurchase.new(purchase_params)
        @item = Item.find(params[:item_id])
        
        if @purchase.valid?
          
          pay_item
          @purchase.save
          return redirect_to new_item_path
        else
          render :index
        end
    end

    private
    
    def purchase_params
       
      # params.require(:user_purchase).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel)
   
       params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :tel, :token, :item_id).merge(user_id: current_user.id)
    end

   

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
        Payjp::Charge.create(
          amount: @item.price,
          card: purchase_params[:token],
          currency: 'jpy'
        )
    end
    
end
