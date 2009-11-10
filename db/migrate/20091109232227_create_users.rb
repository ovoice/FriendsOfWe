class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :title
      t.string :state
      t.timestamps
      
      #authlogic fields follow
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token, :null => false
      t.string :perishable_token
      
      t.integer :login_count, :null => false, :default => 0 
      t.integer :failed_login_count, :null => false, :default => 0 
      t.datetime :last_login_at
      t.string :last_login_ip
    end
  end
  
  def self.down
    drop_table :users
  end
end
