class CreateObservers < ActiveRecord::Migration
  def change
    create_table :observers do |t|
      t.integer :meeting_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
