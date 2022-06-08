class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,           null: false
      t.integer    :delivery_area_id,    null: false
      t.string     :delivery_city,       null: false
      t.string     :delivery_number,     null: false
      t.string     :building_name
      t.string     :phone_number,        null: false
      t.references :record,              null: false, foreign_key: true
      t.string     :timestamps
    end
  end
end