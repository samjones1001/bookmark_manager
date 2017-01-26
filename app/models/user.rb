require 'bcrypt'

class User
  include DataMapper::Resource
  BCrypt::Engine.cost = 1

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :links, through: Resource

  property :id, 		  Serial
  property :email, 		String
  property :password_digest, 	Text

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end
end
