class AddVariablesToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :kp, :integer
    add_column :players, :cash, :integer
    add_column :players, :bank, :integer
    add_column :players, :job, :integer
    add_column :players, :job_level, :integer
    add_column :players, :organization, :integer
    add_column :players, :rank, :integer
    add_column :players, :player_level, :integer
    add_column :players, :skype, :string
    add_column :players, :gadu, :integer
    add_column :players, :signature, :text
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
