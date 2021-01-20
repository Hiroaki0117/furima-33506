class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,     null: false
      t.integer    :area_id,       null: false
      t.string     :city,          null: false
      t.string     :street_number, null: false
      t.string     :buildings
      t.string     :phone_number,  null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end