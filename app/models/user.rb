class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_many :answers
  has_many :comments
  has_many :questions
  has_many :tags

  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /.+@.+\..+/ }
  validates :name, presence: true
  validates :password, presence: true

  has_secure_password
end
