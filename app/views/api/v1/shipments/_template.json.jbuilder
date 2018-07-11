json.id                   shipment.id
json.name                 shipment.name
json.products do
  json.array! shipment.shipment_products, partial: 'api/v1/shipments/template_product', as: :shipment_product
end
