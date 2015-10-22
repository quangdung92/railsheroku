class CreateParticipantTemplates < ActiveRecord::Migration
  def change
    create_table :participant_templates do |t|
      t.integer :kind_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
