class CreateSetsRecordsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sets_records, id: false do |t|
      t.integer :user_id
      t.string :contents
      t.integer :sets
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
