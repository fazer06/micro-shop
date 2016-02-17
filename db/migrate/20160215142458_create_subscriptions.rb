class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.datetime :subscribe
      t.datetime :expire
      t.string :promotion_code
      t.integer :magazine_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
