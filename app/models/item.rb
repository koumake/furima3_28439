class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :genre, :condition

    validates :genre, :condition_id, presence: true
    validates :genre_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
end
