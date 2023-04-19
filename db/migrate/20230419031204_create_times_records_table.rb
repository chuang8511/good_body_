class CreateTimesRecordsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :times_records do |t|
      t.string :account
      t.string :contents
      t.integer :duration

      t.timestamps
    end
  end
end
