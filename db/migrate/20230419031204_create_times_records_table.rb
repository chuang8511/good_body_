class CreateTimesRecordsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :times_records do |t|
      t.integer :user_id
      t.string :contents
      t.integer :duration
      t.float :distance

      t.timestamps
    end
  end
end
