class CreateActionItemHistories < ActiveRecord::Migration
  def change
    create_table :action_item_histories do |t|
      t.integer :action_item_id, :null => false
      t.integer :operation_user_id, :null => false
      t.integer :operation, :null => false
      t.datetime :date, :null => false

      t.timestamps
    end
  end
end
