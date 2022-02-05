class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block_number, :house_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Don't include hyphen(-)"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block_number: block_number, house_name: house_name, phone_number: phone_number, order_id: order.id)
  end

end