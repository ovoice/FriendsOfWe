class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :activities
      t.string :status
      t.integer :volunteer_count
      t.timestamps
    end
  end
  
  def self.down
    drop_table :projects
  end
end
