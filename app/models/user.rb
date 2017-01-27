require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include BCrypt

  # add DataMapper functionality to this class so it can communicate with the database
  include DataMapper::Resource

  validates_confirmation_of(:password)
  validates_format_of :email, :as => :email_address
  validates_presence_of :email

  # these property declarations set the column headers in the 'links' table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :email,    String, :required => true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
