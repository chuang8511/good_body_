class CreateSetsRecordsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sets_records, id: false do |t|
      t.integer :record_set_id, default: -> { self.connection.select_value('SELECT MAX(record_set_id) FROM sets_records').to_i + 1 }
      t.integer :user_id
      t.string :contents
      t.integer :sets
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
