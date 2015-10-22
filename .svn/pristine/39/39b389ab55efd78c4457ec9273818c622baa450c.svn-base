class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :meeting_id, :null => false
      t.string :annotation, :null => false
      t.string :path, :null => false
      t.string :file_name, :null => false

      t.timestamps

      t.index [:path, :file_name], unique: true
    end
  end
end
