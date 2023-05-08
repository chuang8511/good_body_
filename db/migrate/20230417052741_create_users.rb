class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :account, null: false
      t.string :phone_number, null: false
      t.string :name
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :gender


      t.timestamps
    end
  end
end
