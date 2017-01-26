require 'bcrypt'

class User
  include DataMapper::Resource
  
  BCrypt::Engine.cost = 1

  has n, :links, through: Resource

  property :id, 		Serial
  property :email, 		String
  property :password, 	Text

  # def password
  # 	@password ||= Password.new(password)
  # end

  def set_password(new_password)
  	self.password = BCrypt::Password.create(new_password)
  end

end