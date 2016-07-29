require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  # validates_presence_of :email not needed because of required: true

  property :id,      Serial
  property :email,   String, format: :email_address, required: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password  #WHYYY? DOES THIS NOT REVEAL THE PASSWORD?
    self.password_digest = BCrypt::Password.create(password)
  end
end
