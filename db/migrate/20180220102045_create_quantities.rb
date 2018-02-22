class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.decimal :quantity
      t.string  :unit
      t.integer :recipe_id,     null: false
      t.integer :ingredient_id, null: false
    end
  end
end
