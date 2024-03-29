class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :news_id
      t.integer :player_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
