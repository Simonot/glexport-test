class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps
    end

    create_table :shipments do |t|
      t.string :name
      t.references :company 
      t.string :international_transportation_mode
      t.datetime :international_departure_date

      t.timestamps
    end

    create_table :products do |t|
      t.string :sku
      t.string :description
      t.references :company 

      t.timestamps
    end

    create_table :shipment_products do |t|
      t.references :company 
      t.references :product 
      t.integer :quantity

      t.timestamps
    end
  end
end