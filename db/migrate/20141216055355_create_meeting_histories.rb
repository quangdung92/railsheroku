class CreateMeetingHistories < ActiveRecord::Migration
  def change
    create_table :meeting_histories do |t|
      t.integer :meeting_id, :null => false
      t.integer :operation_user_id, :null => false
      t.integer :operation, :null => false
      t.datetime :date, :null => false

      t.timestamps
    end
  end
end
