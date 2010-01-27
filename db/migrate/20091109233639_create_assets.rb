class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :type
      t.string :name
      t.string :description
      t.string :url
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.string :state
      t.references :assetable, :polymorphic => true
      t.timestamps
    end
    add_index :assets, :id
    add_index :assets, [:assetable_id, :assetable_type]
  end
  
  def self.down
    drop_table :assets
  end
end
