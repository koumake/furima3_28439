class Item < ApplicationRecord
    has_many :purchases
    belongs_to :user
    has_one_attached :image
    validate :image_presence
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :genre
    belongs_to_active_hash :condition
    belongs_to_active_hash :day
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture

    
    validates :genre_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }

    with_options presence: true do
        validates :name
        validates :image
        validates :about
        validates :genre_id
        validates :condition_id
        validates :delivery_fee_id
        validates :prefecture_id
        validates :day_id
        validates :price, :numericality => { :greater_than_or_equal_to => 300 }
        validates :price, :numericality => { :less_than_or_equal_to => 9999999 }
    end

    def image_presence
        self.image.attached?
    end
end
