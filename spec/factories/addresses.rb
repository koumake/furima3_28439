FactoryBot.define do
  factory :user_purchase do
    postal_code {'111-1111'}
    prefecture {1}
    city {'ああああ'}
    house_number {111}
    tel {11111111111}
    # purchase_id {1}
    # association :purchase
  end
end
