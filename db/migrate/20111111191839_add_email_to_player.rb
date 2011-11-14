class AddEmailToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :email, :string
    add_column :players, :active, :integer, :default => 0
  end

  def self.down
    remove_column :players, :active_key
    remove_column :players, :active
  end
end
