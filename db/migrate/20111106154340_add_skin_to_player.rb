class AddSkinToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :skin, :integer
  end

  def self.down
    remove_column :players, :skin
  end
end
