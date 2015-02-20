class User < ActiveRecord::Base
  has_many :accounts

  has_secure_password

  validates :username, uniqueness: true
end