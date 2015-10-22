class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.integer :proceeding_id, :null => false
      t.text :content, :null => false

      t.timestamps
    end
  end
end
