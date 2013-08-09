class Question < ActiveRecord::Base
  attr_accessible :title, :text
  validates_presence_of :title, :text

  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :comments, as: :commentable

  has_many :tag_questions
  has_many :tags, :through => :tag_questions
end
