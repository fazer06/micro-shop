class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :email_address

      t.timestamps null: false
    end
  end
end
