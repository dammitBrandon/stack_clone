class Question < ActiveRecord::Base
  attr_accessible :title, :text

  belongs_to :user
  has_many :answers
  has_many :comments

  validates_presence_of :title, :text


end
