class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :name
      t.text :phone_number
      t.string :height
      t.string :weight
      t.integer :age

      t.timestamps
    end
  end
end
