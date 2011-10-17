class Player < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation
	has_friendly_id :name, :use_slug => true
	attr_accessor :password
	before_save :encrypt_password
	
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :name
	validates_uniqueness_of :name
	
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

end
