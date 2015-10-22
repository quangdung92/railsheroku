class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :comment_id, :null => false
      t.integer :user_id, :null => false
      t.boolean :is_confirmed, :default => false

      t.timestamps
    end
  end
end
