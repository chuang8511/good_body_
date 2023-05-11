class CreateFollowStatusRecord < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_status_records do |t|
      t.integer :subject_user_id
      t.string :action_type
      t.integer :object_user_id
      
      t.timestamps
    end
  end
end
