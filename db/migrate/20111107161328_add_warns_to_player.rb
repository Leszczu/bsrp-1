class AddWarnsToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :warns, :integer, :default => 0
  end

  def self.down
    remove_column :players, :warns
  end
end
