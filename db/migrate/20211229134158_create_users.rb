class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :ph_no
      t.string :address

      t.timestamps
    end
  end
end
