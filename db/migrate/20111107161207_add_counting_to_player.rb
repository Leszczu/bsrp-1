class AddCountingToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :hours, :integer, :default => 0
    add_column :players, :minutes, :integer, :default => 0
  end

  def self.down
    remove_column :players, :minutes
    remove_column :players, :hours
  end
end
