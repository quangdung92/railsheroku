class CreateScheduledTimes < ActiveRecord::Migration
  def change
    create_table :scheduled_times do |t|
      t.time :time, null: false
      t.integer :kind, null: false
      t.boolean :short, default: false

      t.timestamps

      t.index [:time, :kind], unique: true
    end
  end
end
