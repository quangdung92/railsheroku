class CreateAgendaTemplates < ActiveRecord::Migration
  def change
    create_table :agenda_templates do |t|
      t.integer :kind_id, :null => false
      t.string :content, :limit => 1024, :null => false

      t.timestamps
    end
  end
end
