class <%= class_name %> < ActiveRecord::Migration
  def self.up
      create_table :railmail_deliveries do |t|
        t.text :recipients
        t.string :from
        t.text :subject
        t.datetime :sent_at
        t.datetime :read_at
        t.text :raw
      end
  end

  def self.down
    drop_table :railmail_deliveries
  end
end
