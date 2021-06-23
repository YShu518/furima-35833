class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :area_id
      validates :shopping_cost_id
      validates :takes_day_id
      validates :used_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :used
  belongs_to :shopping_cost
  belongs_to :user
  belongs_to :area
  belongs_to :takes_day
  has_one_attached :image
  has_one :order
end
