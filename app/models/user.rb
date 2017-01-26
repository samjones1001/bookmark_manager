require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  BCrypt::Engine.cost = 1

  has n, :links, through: Resource

  property :id, 		  Serial
  property :email, 		String
  property :password_digest, 	Text
  validates_confirmation_of :password

  def set_password(new_password)
  	@password = new_password
  	self.password_digest = BCrypt::Password.create(new_password)
  end

end
