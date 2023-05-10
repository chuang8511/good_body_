class CreateLoginRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :login_records do |t|
      t.string :account_number, null: false
      t.boolean :is_login, null: false

      t.timestamps
    end
  end
end
