class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.text :body
      t.decimal :price, precision: 8, scale: 2 # total of 10 digits, 2 of which after the decimal point 

      t.timestamps null: false
    end
  end
end
