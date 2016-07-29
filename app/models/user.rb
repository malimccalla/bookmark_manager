require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,      Serial
  property :email,   String
  property :password_digest, String, length: 60

  def password=(password)
    @password = password  #WHYYY? DOES THIS NOT REVEAL THE PASSWORD?
    self.password_digest = BCrypt::Password.create(password)
  end
end
