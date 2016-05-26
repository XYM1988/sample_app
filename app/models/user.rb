class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates(:name, presence: true)
  validates(:email, presence: true)
  validates(:name, length: {maximum: 50})
  validates(:email, length: {maximum: 255})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, format: {with: VALID_EMAIL_REGEX})
  validates(:email, uniqueness: {case_sensitive: false})
  
  has_secure_password
  validates(:password, presence: true)
  validates(:password, length: {minimum: 6})
end
