class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.integer :player_id
      t.text :intro
      t.text :body
      t.string :cached_slug

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
