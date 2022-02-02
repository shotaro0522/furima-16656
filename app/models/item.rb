class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :state, :delivery_charge, :prefecture, :delivery_date

  belongs_to :user
  has_one_attached :image

  validates :name, :info, :price, :image, :category_id, :state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id,
            presence: true
  validates :category_id, :state_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  VALID_PRICE2_REGEX = /\A[0-9]+\z/.freeze
  validates :price, format: { with: VALID_PRICE2_REGEX, message: 'は半角数値である必要があります' }
end
