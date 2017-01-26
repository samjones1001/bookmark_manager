require 'bcrypt'

class User
  include DataMapper::Resource
  BCrypt::Engine.cost = 1

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :links, through: Resource

  property :id, 		          Serial
  property :email, 		        String, required: true, format: :email_address
  property :password_digest, 	Text,   required: true

  validates_confirmation_of :password
  validates_uniqueness_of :email

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end
end
