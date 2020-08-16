class Item < ApplicationRecord
    has_many :purchases
    belongs_to :user
    has_one_attached :image
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :genre
    belongs_to_active_hash :condition
    belongs_to_active_hash :day
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture

    validates :genre, :condition, :delivery_fee, :prefecture, :day,  presence: true
    validates :genre_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
end
