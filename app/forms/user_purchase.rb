class UserPurchase
    include ActiveModel::Model
    attr_accessor :postal_code, 
                  :prefecture, 
                  :city, 
                  :house_number, 
                  :building_name, 
                  :tel,
                  :user_id,
                  :item_id,
                  :purchase_id,
                  :token
    
    with_options presence: true do
      validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
      validates :tel, format: {with: /\A\d{11}\z/}
      validates :city
      validates :house_number
      validates :prefecture
    end
    end
                  
    def save
      
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tel: tel, purchase_id: purchase_id)
      
    end
                
end