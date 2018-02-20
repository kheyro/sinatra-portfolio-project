class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string  :name
      t.text    :description
      t.integer :cooking_time
      t.integer :user_id
    end
  end
end
