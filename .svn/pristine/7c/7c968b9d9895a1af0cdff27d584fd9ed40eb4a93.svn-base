class CreateCommentHistories < ActiveRecord::Migration
  def change
    create_table :comment_histories do |t|
      t.integer :comment_id, :null => false
      t.integer :operation_user_id, :null => false
      t.integer :operation, :null => false
      t.datetime :date, :null => false

      t.timestamps
    end
  end
end
