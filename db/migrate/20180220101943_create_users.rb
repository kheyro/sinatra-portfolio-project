class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :username,        null: false
      t.string  :name,            null: false
      t.string  :password_digest, null: false
      t.integer :role_id
    end
  end
end
