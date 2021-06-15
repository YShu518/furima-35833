class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :used_id
    validates :price
    validates :area_id
    validates :shopping_cost_id
    validates :takes_day_id
  end

  belongs_to :user
end
