class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :activities
      t.string :status
      t.string :state
      t.integer :volunteer_count
      t.boolean :featured
      t.timestamps
    end
    add_index :projects, :id
    add_index :projects, :status
    add_index :projects, :state
    add_index :projects, :featured
  end
  
  def self.down
    drop_table :projects
  end
end
