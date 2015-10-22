class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name, :null => false
      t.integer :kind_id, :null => false
      t.integer :related_meeting_id
      t.date :dates, :null => false
      t.time :start_time, :null => false
      t.integer :scheduled_time_id
      t.string :venue, :null => false
      t.string :message, :limit => 500, :default => ''
      t.integer :lock_version,  :default => 0
      t.boolean :is_holding, :default => false
      t.boolean :is_canceled, :default => false
      t.boolean :is_completed, :default => false
      t.integer :cybozu_schedule_id
      t.integer :cybozu_schedule_version

      t.timestamps
    end
  end
end
