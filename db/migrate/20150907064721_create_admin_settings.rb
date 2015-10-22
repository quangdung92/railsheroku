class CreateAdminSettings < ActiveRecord::Migration
  def change
    create_table :admin_settings do |t|
      t.boolean :enable_cybozu, :default => true

      t.timestamps
    end
  end
end
