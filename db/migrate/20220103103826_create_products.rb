class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :pr_name
      t.string :pr_category
      t.float :pr_price
      t.string :pr_details

      t.timestamps
    end
  end
end
