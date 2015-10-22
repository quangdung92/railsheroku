class AddUnregisteredGuestToMettings < ActiveRecord::Migration
  def change
    add_column :meetings, :unregistered_guest, :text
  end
end
