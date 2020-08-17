class UserPurchase
    include ActiveModel::Model
    attr_accessor :postal_code, 
                  :prefecture, 
                  :city, 
                  :house_number, 
                  :building_name, 
                  :tel
                  
    def save
    item = Item.find(item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, builing_name: building_name, tel: tel, user_id: current_user.id)
    Purchase.create(user_id: current_user.id, item_id: item.id)
    end
                
end