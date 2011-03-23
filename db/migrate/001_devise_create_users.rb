class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable      
      t.trackable
      t.invitable
      t.string :first_name
      t.string :last_name
      t.string :company_name
      
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true    
  end

  def self.down
    drop_table :users
  end
end
