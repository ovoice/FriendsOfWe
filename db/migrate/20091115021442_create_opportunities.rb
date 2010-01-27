class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities do |t|
      t.string :name
      t.integer :project_id
      t.timestamps
    end
    add_index :opportunities, :id
    add_index :opportunities, :project_id
  end
  
  def self.down
    drop_table :opportunities
  end
end
