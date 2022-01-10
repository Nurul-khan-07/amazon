class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :sup_name
      t.string :sup_email
      t.string :sup_phone
      t.string :address
      t.integer :product_id

      t.timestamps
    end
  end
end
