class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /.+@.+\..+/ }
  validates :password, presence: true

  has_many :questions
  has_many :answers
  has_many :tags


  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
end
