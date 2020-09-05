FactoryBot.define do
    factory :item do
       
       name {'あああ'}
       price {'500'}
       about {'ああああ'}
       genre_id {3}
       condition_id {3}
       delivery_fee_id {3}
       prefecture_id {3}
       day_id {3}
       user_id {2}
       association :user
       title {Faker::Name.title}
      date_time {Faker::Date.between}
      plece {Faker::Address.city}
      number {Faker::Number.within(range: 1..10)}
      target_person {Faker::Lorem.sentence}
    end
end