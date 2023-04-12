class AddMailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mail, :text
  end
end
