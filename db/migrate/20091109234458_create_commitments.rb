class CreateCommitments < ActiveRecord::Migration
  def self.up
    create_table :commitments do |t|
      t.string :state
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :commitments
  end
end
