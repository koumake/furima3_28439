class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:index]
    before_action :set_item, only: [:index, :create, :done, :correct_user]
    def index
       
       @purchase = UserPurchase.new
    end
      
    def create
        @purchase = UserPurchase.new(purchase_params)
        
        if @purchase.valid?
          
          pay_item
          @purchase.save
          return redirect_to action: 'done'
        else
          render :index
        end
    end

    def done
      @item_purchaser = Item.find(params[:item_id])
      @item_purchaser.update(purchaser_id: current_user.id)
      redirect_to items_path
    end

    private
    
    def purchase_params
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

    def correct_user
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id or @item.purchaser_id != nil
        redirect_to root_path
      end
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
    
end
