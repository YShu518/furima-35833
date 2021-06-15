class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :used_id
    validates :price
    validates :area_id
    validates :shopping_cost_id
    validates :takes_day_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
end
