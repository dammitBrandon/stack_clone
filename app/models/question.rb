class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates_presence_of :title, :text

  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :comments, as: :commentable
end
