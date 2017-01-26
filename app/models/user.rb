require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  BCrypt::Engine.cost = 1

  has n, :links, through: Resource

  property :id, 		Serial
  property :email, 		String
  property :password, 	String

  # def password
  # 	@password ||= Password.new(password)
  # end

  def password=(new_password)
  	password = Password.create(new_password)
  end

end