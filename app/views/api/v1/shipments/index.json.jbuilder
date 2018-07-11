json.records do
  json.array! @shipments, partial: 'api/v1/shipments/template', as: :shipment
end
