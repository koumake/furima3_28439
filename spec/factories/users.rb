FactoryBot.define do
    factory :user do
       
       firstname {'中島'}
       lastname {'光一郎'}
       firstname_alias {'ナカジマ'}
       lastname_alias {'コウイチロウ'}
       email {'aaaaa@ttttt'}
       nickname {'aaa'}
       birthday {'1997-04-03'}
       password {'kou1997422'}
       password_confirmation {password}
       
    end
end