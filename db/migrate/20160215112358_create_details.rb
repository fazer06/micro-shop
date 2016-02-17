class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :birthday
      t.string :gender
      t.string :city
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
