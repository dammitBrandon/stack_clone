class Answer < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :text
  validates :user_id, presence: true
  validates :text, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable


end
