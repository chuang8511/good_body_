class CreateUserLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :user_logins do |t|
      t.string :account
      t.string :password
      t.string :name
      t.text :phone_number
      t.string :height
      t.string :weight
      t.integer :age
      t.text :mail
    
      t.timestamps
    end
  end
end
