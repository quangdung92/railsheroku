class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.integer :agenda_id, :null => false
      t.integer :user_id, :null => false
      t.string :content, :limit => 1024, :null => false
      t.date :scheduled_date, :null => false
      t.date :completion_date

      t.timestamps
    end
  end
end
