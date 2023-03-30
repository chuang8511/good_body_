class CreateTestUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :test_users do |t|
      t.string :name, null: false
      t.string :identifier, null: false
      t.datetime :registration_datetime, null: false

      t.timestamps
    end
  end
end
