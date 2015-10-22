class CreateProceedings < ActiveRecord::Migration
  def change
    create_table :proceedings do |t|
      t.integer :meeting_id, :null => false

      t.timestamps
    end
  end
end
