class Player < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :on => :create
  attr_accessible :avatar, :skin, :gadu, :skype, :signature, :answer
  has_friendly_id :name, :use_slug => true
  attr_accessor :password, :new_password, :new_password_confirmation
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :name, :password, :on => :create
  validates_uniqueness_of :name
  
  #attr_accessible :new_password, :new_password_confirmation, :on => :update
  #validates_presence_of :new_password, :new_password_confirmation, :on => :update
  #validate :validate_old_password, :on => :update
  #validate :validate_new_password, :on => :update

  has_attached_file :avatar, :styles => { :small => "80x80>" },
                  :url  => "/konto/pliki/avatar/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/konto/pliki/avatar/:id/:style/:basename.:extension",
                  :default_url   => "/images/avatars/default_avatar.png"

  # Avatar nie jest wymagany, opcjonalnie
  # validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  #def validate_old_password
  #  if self.password.nil? || (!self.password_hash.nil? && get_password_hash(self.password) != self.password_hash)
  #    errors.add(:base, "Wprowazone hasło jest niepoprawne")
  #  end
  #end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    PlayerMailer.password_reset(self).deliver
  end
  
  def active_send
    generate_token(:active_send)
    save!
    PlayerMailer.active_send(self).deliver
  end
  
  def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Player.exists?(column => self[column])
  end
  
  #def change_password
  #  password, password_confirmation = params[:player][:password], params[:player][:password_confirmation]
  #  current_player.change_password(password, password_confirmation)
  #end
  
  #def validate_new_password
  #  if self.new_password != self.new_password_confirmation
  #    errors.add(:base, "Podane hasła nie są takie same")
  #  else
  #    self.password = new_password
  #  end
  #end

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