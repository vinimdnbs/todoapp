require 'digest/sha1'

class User < ActiveRecord::Base
  attr_accessor :password

  has_many :tasks
  has_many :labels

  before_save :encrypt_password
  after_save :clear_password

  validates :email, presence:{message: 'Insira um email'}, uniqueness:{message: 'Este email ja esta cadastrado'}, format:{with: %r{.+@.+\..+}, message: 'Email invalido', allow_blank: true}
  validates_length_of :password, :in => 6..16, message: 'Insira uma senha de 6 a 16 caracteres'

  attr_accessible :email, :password

  def self.authenticate(email='', password='')
    user = User.find_by_email(email)

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(password='')
    encrypted_password == Digest::SHA1.hexdigest(password)
  end

  def encrypt_password
    unless password.blank?
      self.encrypted_password = Digest::SHA1.hexdigest(password)
    end
  end

  def clear_password
    self.password = nil
  end
end
