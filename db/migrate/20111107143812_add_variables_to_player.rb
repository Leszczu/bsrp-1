class AddVariablesToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :kp, :integer, :default => 0
    add_column :players, :cash, :integer, :default => 500
    add_column :players, :bank, :integer, :default => 1000
    add_column :players, :job, :integer, :default => 0
    add_column :players, :job_level, :integer, :default => 0
    add_column :players, :organization, :integer, :default => 0
    add_column :players, :rank, :integer, :default => 0
    add_column :players, :player_level, :integer, :default => 1
    add_column :players, :skype, :string
    add_column :players, :gadu, :integer
    add_column :players, :signature, :text, :limit => 120
  end

  def self.down
    remove_column :players, :signature
    remove_column :players, :gadu
    remove_column :players, :skype
    remove_column :players, :player_level
    remove_column :players, :rank
    remove_column :players, :organization
    remove_column :players, :job_level
    remove_column :players, :job
    remove_column :players, :bank
    remove_column :players, :cash
    remove_column :players, :kp
  end
end
