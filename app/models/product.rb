class Product < ApplicationRecord
  belongs_to :company
  has_many :shipment_products
end
