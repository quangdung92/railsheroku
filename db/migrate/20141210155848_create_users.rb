class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_id, :null => false, :limit => 100, :comment => 'login id'
      t.string :name, :null => false, :limit => 100, :comment => 'name'
      t.string :kana, :null => true, :limit => 200, :comment => 'kana'
      t.string :mailaddress, :null => true, :limit => 256, :comment => 'mailaddress'
      t.string :password_digest, :null => false, :comment => 'password(digest)'
      t.integer :cybozu_id, :null => true, :comment => 'cybozu id'
      t.integer :grant, :null => false, :comment => '0=admin user 1=normal user'
      t.string :remember_token, :comment => 'remember_token'
      t.boolean :is_deleted, :default => false, :comment => 'true=user deleted'
      t.boolean :is_firstlogged,:default => false, :comment => 'true=user first logged'

      t.timestamps
    end
    #index
    add_index :users, :login_id
    add_index :users, :name
    add_index :users, :kana
    add_index :users, :remember_token
  end
end
