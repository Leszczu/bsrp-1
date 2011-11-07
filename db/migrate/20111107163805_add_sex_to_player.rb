class AddSexToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :sex, :integer
  end

  def self.down
    remove_column :players, :sex
  end
end
