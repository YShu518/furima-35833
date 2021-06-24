class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address_line1, :address_line2, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line1
    validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id, token: token)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address_line1: address_line1,
                   address_line2: address_line2, phone_number: phone_number, order_id: order.id)
  end
end
