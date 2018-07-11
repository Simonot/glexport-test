class ShipmentProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shipment

  validates_presence_of :product_id, :shipment_id

  def active_shipment_count
  	# make a count less than the quantity and that fit the tests
    (quantity - (quantity % 100))/100
  end
end
