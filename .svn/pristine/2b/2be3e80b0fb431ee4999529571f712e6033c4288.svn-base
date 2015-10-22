class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :meeting_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
