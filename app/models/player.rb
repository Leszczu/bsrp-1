class Player < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  attr_accessible :new_password, :new_password_confirmation
  has_friendly_id :name, :use_slug => true
  attr_accessor :password
  attr_accessor :new_password, :new_password_confirmation
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :new_password, :new_password_confirmation, :on => :update
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :validate_old_password, :on => :update
  validate :validate_new_password, :on => :update


  def validate_old_password
    if self.password.nil? || (!self.password_hash.nil? && get_password_hash(self.password) != self.password_hash)
      errors.add(:base, "Wprowazone hasło jest niepoprawne")
    end
  end
  

  def validate_new_password
    if self.new_password != self.new_password_confirmation
      errors.add(:base, "Podane hasła nie są takie same")
    end
  end

  def self.authenticate(name, password)
    player = find_by_name(name)
    if player && player.password_hash == BCrypt::Engine.hash_secret(password, player.password_salt)
      player
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  private
  
  def get_password_hash(password)
    BCrypt::Engine.hash_secret(password, self.password_salt)
  end

end