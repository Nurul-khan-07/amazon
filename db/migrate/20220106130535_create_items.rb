class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_cat
      t.float :item_price
      t.string :item_details

      t.timestamps
    end
  end
end
