class CreateCommitments < ActiveRecord::Migration
  def self.up
    create_table :commitments do |t|
      t.string :state
      t.string :name
      t.string :comment
      t.integer :user_id
      t.integer :project_id
      t.integer :opportunity_id
      t.timestamps
    end
    add_index :commitments, :id
    add_index :commitments, :state
    add_index :commitments, :user_id
    add_index :commitments, :project_id
    add_index :commitments, :opportunity_id
  end
  
  def self.down
    drop_table :commitments
  end
end
